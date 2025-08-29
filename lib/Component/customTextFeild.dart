// ignore_for_file: must_be_immutable, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Network/API.dart';
import 'color.dart';

class CustomTextFields extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  CustomTextFields(
      {super.key,
      this.hintText,
      this.obscureText = false,
      this.suffix,
      required this.controller,
      this.borderColor = true,
      this.focus = false,
      this.maxLines = 1,
      this.minLines,
      this.prefixIcons,
      this.onlyRead = true,
      this.validationError,
      this.isConfirmPassword = false,
      this.isConfirmPasswords = false,
      this.expands = false,
      this.isEmail = false,
      this.align = TextAlign.start,
      this.radiusCircle = 20,
      this.fillColor,
      this.textInputType = TextInputType.text,
      this.borderAssignColor,
      this.hintStyle,
      this.borderWidth,
      this.decoration,
      this.onTap,
      this.suffixContentPadding,
      this.onFieldSubmitted,
      this.cursorColor,
      this.contentPad = true,
      this.textCustomStyle,
      this.onChanged,
      this.isUserName,
      this.referral,
      this.textInputAction = TextInputAction.next,
      this.inputFormatter,
      this.textAlignVertical = TextAlignVertical.top,
      this.enable = true,
      this.widths,
      this.onDone});

  String? hintText;
  Widget? suffix;
  bool? obscureText = false;
  bool? isUserName = false;
  bool? focus = false;
  ValueChanged<String>? onFieldSubmitted;
  bool? borderColor = true;
  int? maxLines;
  int? minLines;
  Widget? prefixIcons;
  List<TextInputFormatter>? inputFormatter;
  BoxDecoration? decoration;
  bool? onlyRead;
  bool? isConfirmPasswords;
  TextInputType? textInputType;
  String? validationError;
  bool? isConfirmPassword = false;
  bool? isEmail = false;
  bool? referral = false;
  bool expands = false;
  bool? enable = true;
  double? radiusCircle;
  Color? fillColor;
  EdgeInsets? suffixContentPadding;
  Color? borderAssignColor;
  Color? cursorColor;
  TextInputAction? textInputAction;
  TextStyle? hintStyle;
  TextStyle? textCustomStyle;
  TextAlign align = TextAlign.start;
  TextAlignVertical textAlignVertical = TextAlignVertical.top;
  bool contentPad = true;
  VoidCallback? onDone;
  GestureTapCallback? onTap;
  ValueChanged<String>? onChanged;
  // ignore: prefer_typing_uninitialized_variables
  double? borderWidth;
  double? widths;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

        width: widths ?? double.infinity,
        child: TextFormField(
          onTap: onTap,
          inputFormatters: inputFormatter,
          onSaved: (c) {},
          onEditingComplete: onDone,
          enabled: enable,
          textAlign: align,
          textInputAction: textInputAction,
          cursorColor: cursorColor ?? DynamicColors.primaryColor,
          autofocus: focus!,
          style: textCustomStyle ??
              TextStyle(
                fontSize: 16,
                color: API().sp.read('themeMode') == "dark"
                    ? DynamicColors.whiteColor
                    : DynamicColors.dividerColor,
              ),
          controller: controller,
          keyboardType: textInputType,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: fillColor ?? DynamicColors.whiteColor,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusCircle ?? 10),
                borderSide: BorderSide(
                  color: borderAssignColor ?? DynamicColors.primaryColor,
                  width: borderWidth ?? 1.8,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusCircle ?? 10),
                borderSide: BorderSide(
                  color: borderAssignColor ?? Colors.transparent,
                  width: borderWidth ?? 1.8,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusCircle ?? 10),
                borderSide: BorderSide(
                  color: borderAssignColor ?? Colors.transparent,
                  width: borderWidth ?? 1.8,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radiusCircle ?? 10),
                borderSide: BorderSide(
                  color: Color(0xffdf1820),
                  width: borderWidth ?? 1.8,
                )),

            contentPadding:
            suffixContentPadding
            ??
                (suffix == null
                    ? EdgeInsets.only(
                        left: contentPad ? 12 : 0,

                      )
                    : EdgeInsets.only(
                        left: 12,
                        top: 15,
                      )),

            hintText: hintText,
            hintStyle: hintStyle ?? TextStyle(),
            // helperStyle: montserratStyle(),
            suffixIcon: suffix,
            prefixIcon: prefixIcons,
          ),
          readOnly: !onlyRead!,
          maxLines: maxLines,
          textAlignVertical: textAlignVertical,
          minLines: minLines == 0 ? null : 1,
          expands: expands,
          obscureText: obscureText!,
          // validator: (value) {
          //   if (value!.isEmpty && referral == false) {
          //     return 'Please enter $validationError';
          //   } else if (isConfirmPassword == true) {
          //     AuthController loginController = Get.find();
          //     if (loginController.signUpPassword.text ==
          //         loginController.signUpConfirmPassword.text) {
          //       return validatePassword(value, loginController);
          //     } else {
          //       if (isConfirmPasswords == true) {
          //         return "Password doesn't match";
          //       }
          //       loginController.signUpConfirmPassword.clear();
          //       return null;
          //     }
          //   } else if (validationError == "Name") {
          //     return fullNameValidate(value);
          //   } else if (validationError == "ZipCode") {
          //     return nameWithNum(value);
          //   } else if (isUserName == true) {
          //     if (value.length >= 8 && value.length <= 16) {
          //       return null;
          //     } else {
          //       return "Characters must be 8 to 16";
          //     }
          //   } else {
          //     if (isEmail == true) {
          //       return validateEmail(value);
          //     } else {
          //       return null;
          //     }
          //   }
          // },
        ));
  }

  // validatePassword(String value, AuthController loginController) {
  //   String pattern =
  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value)) {
  //     if (isConfirmPasswords == true) {
  //       return "1 capital, 1 special character, and must be 8 characters long";
  //     }
  //     loginController.signUpConfirmPassword.clear();
  //     return null;
  //   } else {
  //     return null;
  //   }
  // }

  validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Please enter valid email ";
    } else {
      return null;
    }
  }

  nameWithNum(String fullName) {
    String pattern = r'(?!^\d+$)([!@#$%_\^\&amp;\*\-\.\?]{5,49})*[a-zA-Z]+$';
    RegExp regExp = RegExp(pattern);
    RegExp regExps = RegExp(r'^[0-9. !@#$%^&*()-_=+]+$', caseSensitive: true);
    // RegExp special = RegExp(r'^[!@#$%^&*()-_=+]+$');
    if (fullName.isEmpty) {
      return 'Please enter $validationError';
    } else {
      if (!regExp.hasMatch(fullName)) {
        return '$validationError is invalid';
      } else if (regExp.hasMatch(fullName)) {
        return null;
      } else if (regExps.hasMatch(fullName)) {
        return '$validationError is invalid';
      } else if (fullName.length <= 2) {
        return '$validationError is too short';
      }
      return null;
    }
  }

  fullNameValidate(String fullName) {
    String pattern = r'^[a-z A-Z]+$';
    RegExp regExp = RegExp(pattern);
    if (fullName.isEmpty) {
      return 'Please enter $validationError';
    } else if (!regExp.hasMatch(fullName)) {
      return '$validationError is invalid';
    } else if (fullName.length <= 2) {
      return '$validationError is too short';
    }
    return null;
  }
}

// timeAgoSinceDate(String dateTime) {
//   DateTime date = DateTime.now();
//   String? today;
//   String? times;
//   final DateFormat formatter = DateFormat('yy/MM/dd');
//   final DateFormat timeFormatter = DateFormat('hh:mm aa');
//   DateTime d = DateTime.parse(dateTime).toLocal();
//   var difference = DateOnlyCompare(d).isSameDate(date);
//   if (difference == false) {
//     var time = d.difference(date).inDays;
//     var min = d.difference(date).inMinutes;
//     if (time == 0) {
//       times = timeFormatter.format(DateTime.parse(dateTime).toLocal());
//       if (min < 0) {
//         min = min * -1;
//       }
//       if (min > 59) {
//         int m = (min / 60).floor();
//         if (m < 2) {
//           return "$m\h";
//         } else {
//           return "$m\h";
//         }
//       } else {
//         if (min <= 1) {
//           return "Just Now";
//         }
//         return "$min Mins ago";
//       }
//     } else if (time <= -1 && time > -364) {
//       time = time * -1;
//       times = timeFormatter.format(DateTime.parse(dateTime).toLocal());
//       if (time == 1) {
//         today = "$time day";
//       } else {
//         today = "$time days";
//       }
//       return today;
//     } else if (time < -364) {
//       times = timeFormatter.format(DateTime.parse(dateTime).toLocal());
//       today = formatter.format(DateTime.parse(dateTime).toLocal());
//
//       return today;
//     } else {
//       if (min > 59) {
//         int m = (min / 60).floor();
//         if (m < 2) {
//           return "$m\h";
//         } else {
//           return "$m\h";
//         }
//       } else {
//         if (min <= 1) {
//           return "Just Now";
//         }
//         return "$min\m";
//       }
//     }
//   } else {
//     var min = date.difference(d).inMinutes;
//     times = timeFormatter.format(DateTime.parse(dateTime).toLocal());
//     today = times.toString();
//     if (min < 1) {
//       return "Just Now";
//     } else if (min <= 59) {
//       return "$min\m";
//     } else if (min > 59) {
//       int m = (min / 60).floor();
//       if (m < 2) {
//         return "$m\h";
//       } else {
//         return "$m\h";
//       }
//     }
//     return today;
//   }
// }

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
