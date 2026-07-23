/// A single message in a broadcast thread.
/// [fromCustomer] = a reply from a customer (only used if replies are enabled);
/// otherwise it's a sender (broadcast) message.
class BroadcastMessage {
  final String? text;
  final String? imagePath; // local file path (from camera/gallery)
  final String? imageUrl; // remote url (from backend)
  final String time;
  final bool fromCustomer;

  const BroadcastMessage({
    this.text,
    this.imagePath,
    this.imageUrl,
    required this.time,
    this.fromCustomer = false,
  });
}
