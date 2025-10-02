import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateStartController extends GetxController {
  var startDateController = TextEditingController().obs;

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      startDateController.value.text = formattedDate;
    }
  }
}


class DateEndController extends GetxController {
  var startDateController = TextEditingController().obs;

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      startDateController.value.text = formattedDate;
    }
  }
}
