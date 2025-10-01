import 'package:flutter/material.dart';

class WidgetDropDown extends StatefulWidget {
  const WidgetDropDown({super.key});

  @override
  State<WidgetDropDown> createState() => _WidgetDropDownState();
}

class _WidgetDropDownState extends State<WidgetDropDown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
   
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}

const List<String> list = ["One Way", "Two Way"];
