import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/shared/http_service/http_service.dart';

import '../shared/styles/style_constants.dart';
import 'bottom_sheet.dart';

class SquareFloatinButton extends StatelessWidget {
  const SquareFloatinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.edit,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topStart: const Radius.circular(StyleConstants.borderRadius).w,
              topEnd: const Radius.circular(StyleConstants.borderRadius).w,
            ),
          ),
          builder: (context) => blury(child: Sheet()),
        );
      },
    );
  }
}
