import 'package:connect/module/broadcastlist/data/broadcast_list_models.dart';
import 'package:connect/module/broadcastlist/data/broadcast_list_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final broadcastListRepositoryProvider = Provider<BroadcastListRepository>((ref) => BroadcastListRepository());

/// The user's broadcast lists (Broadcast tab).
final broadcastListsProvider = FutureProvider<List<BroadcastListSummary>>((ref) {
  return ref.read(broadcastListRepositoryProvider).myLists();
});

/// History of messages sent to one list.
final broadcastListMessagesProvider =
    FutureProvider.family<List<ListMessage>, String>((ref, listId) {
  return ref.read(broadcastListRepositoryProvider).messages(listId);
});

/// One list's members (for the Manage Recipients screen).
final broadcastListDetailProvider =
    FutureProvider.family<BroadcastListDetail, String>((ref, listId) {
  return ref.read(broadcastListRepositoryProvider).detail(listId);
});
