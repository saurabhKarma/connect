import 'package:connect/module/broadcast/data/broadcast_api_models.dart';
import 'package:connect/module/broadcast/data/broadcast_api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final broadcastApiRepositoryProvider = Provider<BroadcastApiRepository>((ref) => BroadcastApiRepository());

/// Broadcasts the current user has sent, newest first.
final sentBroadcastsProvider = FutureProvider<List<BroadcastItem>>((ref) async {
  final page = await ref.read(broadcastApiRepositoryProvider).list(page: 0, size: 50);
  return page.content;
});

/// A single broadcast + its per-recipient delivery rows.
final broadcastDetailProvider = FutureProvider.family<BroadcastDetail, String>((ref, id) {
  return ref.read(broadcastApiRepositoryProvider).detail(id);
});
