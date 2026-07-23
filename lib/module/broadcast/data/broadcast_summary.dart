import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A broadcast as shown in the Home list (name, last message preview, time).
class BroadcastSummary {
  final String id;
  final String name;
  final String preview;
  final String time;
  final bool unread;

  const BroadcastSummary({
    required this.id,
    required this.name,
    required this.preview,
    required this.time,
    this.unread = false,
  });
}

/// TODO: replace with GET /broadcasts. Mock data for now so the list renders;
/// an empty list shows the "Start Broadcast" empty state.
final broadcastListProvider = Provider<List<BroadcastSummary>>((ref) => const [
      BroadcastSummary(
          id: '1',
          name: 'Saurabh Vishwakarma',
          preview: 'realme battery is available....',
          time: '11:30 PM',
          unread: true),
      BroadcastSummary(
          id: '2',
          name: 'Broadcast Battery',
          preview: 'realme battery is available....',
          time: '9:37 PM'),
      BroadcastSummary(
          id: '3',
          name: 'City Mall Battery Dealer',
          preview: 'realme battery is available....',
          time: '8:30 PM'),
    ]);
