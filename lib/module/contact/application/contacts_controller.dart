import 'package:connect/module/contact/data/contact_ui.dart';
import 'package:connect/module/contact/data/device_contacts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceContactsRepositoryProvider =
    Provider<DeviceContactsRepository>((ref) => DeviceContactsRepository());

/// Loads device contacts after asking permission. Errors with
/// [ContactsPermissionException] when permission is denied.
final contactsControllerProvider =
    AsyncNotifierProvider<ContactsController, List<ContactUi>>(ContactsController.new);

class ContactsController extends AsyncNotifier<List<ContactUi>> {
  @override
  Future<List<ContactUi>> build() => _load();

  Future<List<ContactUi>> _load() async {
    final repo = ref.read(deviceContactsRepositoryProvider);
    final granted = await repo.requestReadPermission();
    if (!granted) throw const ContactsPermissionException();
    return repo.loadContacts();
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }
}
