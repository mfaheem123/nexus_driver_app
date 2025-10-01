import 'package:get/get.dart';

class ChatAdmin extends GetxController {
  var message = <String>[].obs;
  var text = " ".obs;

  void sendMessage() {
    if (text.value.trim().isEmpty) return;
    message.insert(0, text.value.trim());
    text.value = "";
  }
}
