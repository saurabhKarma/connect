import 'package:connect/module/profile/data/profile_models.dart';
import 'package:connect/module/profile/data/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) => ProfileRepository());

/// The current user's profile (name + avatar). Invalidate after an edit to refresh.
final profileProvider = FutureProvider<Profile>((ref) {
  return ref.read(profileRepositoryProvider).getProfile();
});
