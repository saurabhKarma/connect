import 'package:connect/module/contact/data/contact_ui.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

/// Thrown when the user hasn't granted contacts permission.
class ContactsPermissionException implements Exception {
  const ContactsPermissionException();
}

/// Reads and writes the device address book.
class DeviceContactsRepository {
  Future<bool> requestReadPermission() => FlutterContacts.requestPermission(readonly: true);

  Future<List<ContactUi>> loadContacts() async {
    final contacts = await FlutterContacts.getContacts(withProperties: true, withThumbnail: true);
    final result = contacts
        .where((c) => c.phones.isNotEmpty)
        .map((c) => ContactUi(
              id: c.id,
              name: c.displayName.trim().isEmpty ? c.phones.first.number : c.displayName,
              phone: c.phones.first.number,
              photo: c.thumbnail,
            ))
        .toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return result;
  }

  /// Insert a new contact into the device address book.
  Future<void> saveContact({required String name, required String phone}) async {
    final granted = await FlutterContacts.requestPermission(readonly: false);
    if (!granted) throw const ContactsPermissionException();
    final contact = Contact()
      ..name.first = name
      ..phones = [Phone(phone)];
    await FlutterContacts.insertContact(contact);
  }
}
