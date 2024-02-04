import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/shared/styles/style_constants.dart';

class SquareIconButton extends StatelessWidget {
  const SquareIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.forgroundColor,
    required this.size,
    this.borderWidth = 0,
    this.backgroundColor = Colors.transparent,
  });

  final Color forgroundColor;
  final Color backgroundColor;
  final double size;
  final double borderWidth;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      borderRadius: BorderRadius.circular(10).w,
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          // color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius).w,
          border: borderWidth == 0
              ? null
              : Border.all(
            color: forgroundColor,
            width: borderWidth,
          ),
        ),
        child: Icon(
          icon,
          color: forgroundColor,
          size: (size / 2).w,
        ),
      ),
    );
  }
}