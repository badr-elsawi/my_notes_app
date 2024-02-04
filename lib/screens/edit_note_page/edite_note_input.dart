import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTextInput extends StatelessWidget {
  EditTextInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.errorMessage,
    this.maxLines = 1,
    this.isTitle = false,
  });

  TextEditingController controller;
  int maxLines;
  String hintText;
  String errorMessage;
  bool isTitle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: isTitle
          ? Theme.of(context).textTheme.displayLarge!.merge(
                TextStyle(
                  height: 1.5,
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
          : Theme.of(context).textTheme.bodyMedium!.merge(
                const TextStyle(
                  height: 1.5,
                  // fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
      validator: (value) {
        if (value!.isNotEmpty) {
          return errorMessage;
        }
      },

      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    );
  }
}
