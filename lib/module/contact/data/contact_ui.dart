import 'dart:typed_data';

/// Lightweight contact model for the UI (from the device address book).
class ContactUi {
  final String id;
  final String name;
  final String phone;
  final Uint8List? photo;

  const ContactUi({required this.id, required this.name, required this.phone, this.photo});
}
