import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  TextInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.errorMessage,
    this.maxLines = 1,
  });

  TextEditingController controller;
  int maxLines;
  String hintText;
  String errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.displayMedium,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return errorMessage;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}