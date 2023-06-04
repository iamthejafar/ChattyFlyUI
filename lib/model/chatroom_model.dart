


class ChatRoom {
  final String id;
  final String name;
  final List<String> members;
  final List<ChatMessage> messages;

  ChatRoom({
    required this.id,
    required this.name,
    required this.members,
    required this.messages,
  });
}

class ChatMessage {
  final String senderId;
  final String text;
  final DateTime timestamp;

  ChatMessage({
    required this.senderId,
    required this.text,
    required this.timestamp,
  });
}
