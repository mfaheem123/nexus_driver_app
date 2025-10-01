import 'package:driver_app_alpha/Component/addsuggestion.dart';
import 'package:driver_app_alpha/Controller/messageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerMessage extends StatelessWidget {
  ControllerMessage({super.key});

  final ChatController controller = Get.put(ChatController());
  final TextEditingController inputController = TextEditingController();

  void _openSuggestionSheet() {
    Get.bottomSheet(
      AddsuggestionWidget(
        onSelect: (value) {
          inputController.text = value; 
          controller.text.value = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 91, 19, 128),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        controller.messages[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            color: theme.cardColor,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    _openSuggestionSheet();
                  },
                  icon: const Icon(Icons.add, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: TextField(
                    controller: inputController,
                    onChanged: (val) => controller.text.value = val,
                    decoration: const InputDecoration(
                      hintText: "Write a message...",
                                    hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.deepPurple),
                  onPressed: () {
                    controller.sendMessage();
                    inputController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
