/// Tracks which conversation is currently on screen, so foreground notifications for THAT chat
/// are suppressed (WhatsApp-style) while messages for other chats still notify.
class ActiveChat {
  ActiveChat._();
  static final ActiveChat instance = ActiveChat._();

  String? _conversationId;

  void enter(String conversationId) => _conversationId = conversationId;

  void leave(String conversationId) {
    if (_conversationId == conversationId) _conversationId = null;
  }

  bool isOpen(String? conversationId) =>
      conversationId != null && conversationId == _conversationId;
}
