import 'package:get/get.dart';

import '../model/chatroom_model.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();


class HomeScreenController extends GetxController{
  Rx<bool> _showTextField = Rx<bool>(false);

  bool get getShowTextFieldValue => _showTextField.value;


  List<ChatRoom> _chatRooms = [];

  List<ChatRoom> get chatRooms => _chatRooms;

  void createChatRoom(String name, List<String> members) {
    String id = _generateChatRoomId();
    ChatRoom chatRoom = ChatRoom(
      id: id,
      name: name,
      members: members,
      messages: [],
    );
    _chatRooms.add(chatRoom);
  }

  void joinChatRoom(String roomId, String memberId) {
    ChatRoom chatRoom = _chatRooms.firstWhere((chatRoom) => chatRoom.id == roomId);
    if (!chatRoom.members.contains(memberId)) {
      chatRoom.members.add(memberId);
    }
  }

  void leaveChatRoom(String roomId, String memberId) {
    ChatRoom chatRoom = _chatRooms.firstWhere((chatRoom) => chatRoom.id == roomId);
    chatRoom.members.remove(memberId);
  }

  void sendMessage(String roomId, String senderId, String message) {
    ChatRoom chatRoom = _chatRooms.firstWhere((chatRoom) => chatRoom.id == roomId);
    ChatMessage chatMessage = ChatMessage(
      senderId: senderId,
      text: message,
      timestamp: DateTime.now(),
    );
    chatRoom.messages.add(chatMessage);
  }

  String _generateChatRoomId() {
    // generate a unique ID for the chat room
    return uuid.v1();
  }


  void setShowTextFieldValue(bool value){
    _showTextField.value = value;
  }
}
