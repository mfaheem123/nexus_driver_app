import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <String>[].obs; 
  var text = "".obs;

  void sendMessage() {
    if (text.value.trim().isEmpty) return;
    messages.insert(0, text.value.trim()); 
    text.value = ""; 
  }
}



class WayController extends GetxController{
    RxBool viaLocation = false.obs;

}