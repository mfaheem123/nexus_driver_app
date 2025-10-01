import 'package:flutter/material.dart';

import 'color.dart';

class DropDownClass extends StatelessWidget {

  final bool customIcon;
  final String _hint;
  final String? _initialValue;
  final List? _list;
  final Widget? _prefixIcon;
  final Color? _dropDownColor;
  final bool _isPrefixIcon;
  final bool _objectDropDown;
  final InputDecoration? _inputDecoration;
  List get list => _list!;
  final dynamic Function(dynamic)? _listener;

  DropDownClass({
    this.customIcon = false,
    List? list,
    var hint,
    String? initialValue,
    Color? dropDownColor,
    Widget? prefixIcon,
    InputDecoration? inputDecoration,
    bool isPrefixIcon = true,
    bool border = true,
    bool objectDropDown = true,
    dynamic Function(dynamic)? listener,
    dynamic Function(dynamic)? objectListener,

  })
      :
        _list = list,
        _hint = hint,
        _initialValue = initialValue,
        _isPrefixIcon = isPrefixIcon,
        _inputDecoration = inputDecoration,
        _prefixIcon = prefixIcon,
        _dropDownColor = dropDownColor,
        _listener = listener,
        _objectDropDown = objectDropDown;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: _objectDropDown
          ? DropdownButtonFormField<String>(
              // padding: EdgeInsets.zero,
              value: _initialValue,
              // value: _val,
              //  value: _hint??"",
              dropdownColor: _dropDownColor ?? Colors.white,
              decoration: _inputDecoration ??
                  (_isPrefixIcon == false
                      ? const InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true)
                      : InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: _prefixIcon,
                          // prefixIcon: customIcon == false
                          //     ? Icon(Icons.person,
                          //         size: 22, color: DynamicColors.primaryColor)
                          //     : Icon(Icons.event),
                          fillColor: Colors.white,
                          filled: true)),

              style: TextStyle(
                color: Color(0xff272727),
                fontWeight: FontWeight.w300,
              ),

              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),

              hint: Text(
                _hint,
                style: TextStyle(color: DynamicColors.whiteColor, fontSize: 15),
              ),

              items: list.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,
                      style: TextStyle(
                        color: DynamicColors.whiteColor,
                        fontWeight: FontWeight.w300,
                      )),
                );

              }).toList(),

              onChanged: (value) {
                if (_listener != null) _listener!.call(value);
                // if(_listType == "focus"){
                //   list.map((item) {
                //     if (item.minutes.toString() == value) {
                //       if (_objectListener != null) _objectListener!.call(item);
                //     }
                //   }).toList();
                // }
              },
            )

          : DropdownButtonFormField<dynamic>(
              // padding: EdgeInsets.zero,
              dropdownColor: _dropDownColor ?? Colors.white,
              decoration: _inputDecoration ??
                  (_isPrefixIcon == false
                      ? InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true)
                      : InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: _prefixIcon,
                          fillColor: Colors.white,
                          filled: true)),

              style: TextStyle(
                color: Color(0xff272727),
                fontWeight: FontWeight.w300,
              ),

              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black87,
              ),

              hint: Text(
                _hint,
                style: TextStyle(color: DynamicColors.whiteColor, fontSize: 15),
              ),

              items: list.map((item) {
                return DropdownMenuItem<dynamic>(
                  value: item,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(item.thumbnail),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Text(item.title,
                          style: TextStyle(
                            color: DynamicColors.whiteColor,
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  ),
                );
              }).toList(),

              onChanged: (value) {
                if (_listener != null) _listener!.call(value);
                // if(_listType == "focus"){
                //   list.map((item) {
                //     if (item.minutes.toString() == value) {
                //       if (_objectListener != null) _objectListener!.call(item);
                //     }
                //   }).toList();
                // }
              },
            ),

    );
  }
}
