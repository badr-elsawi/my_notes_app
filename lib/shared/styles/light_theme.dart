import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/shared/styles/style_constants.dart';

ThemeData lightTheme = ThemeData(
  // useMaterial3: true,
  scaffoldBackgroundColor: Color(0xff060E18),
  primaryColor: Colors.teal,
  accentColor: Colors.teal,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  inputDecorationTheme: inputDecorationTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  bottomSheetTheme: bottomSheetTheme,
  floatingActionButtonTheme: floatingActionButtonTheme,
);

// app bar theme *******************************************
AppBarTheme appBarTheme = const AppBarTheme(
  elevation: 0,
  backgroundColor: Colors.transparent,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xff060E18),
  ),
);
// app bar theme *******************************************

// text theme *******************************************
TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    color: Color(0xffF7F7F7),
  ),
  bodyLarge: TextStyle(
    fontSize: 18.sp,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    color: Color(0xffF7F7F7),
  ),
  bodyMedium: TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    color: Color(0xffF7F7F7),
  ),
  bodySmall: TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    color: Color(0xffF7F7F7),
  ),
  displayMedium: TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    color: Color(0xffF7F7F7),
  ),
);
// text theme *******************************************

// text field theme *************************************
InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  filled: false,
  hintStyle: TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    color: Color(0xffF7F7F7),
  ),
  errorStyle: TextStyle(
    fontSize: 11.sp,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    color: Colors.deepOrangeAccent,
  ),
  // borders styles ************************
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius).w,
    borderSide: BorderSide(
      width: 1,
      color: Color(0xffF0F0F0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius).w,
    borderSide: BorderSide(
      width: 1,
      color: Color(0xffF0F0F0),
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius).w,
    borderSide: BorderSide(
      width: 1,
      color: Colors.deepOrangeAccent,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius).w,
    borderSide: BorderSide(
      width: 1,
      color: Colors.deepOrangeAccent,
    ),
  ),
);

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(
      vertical: 12.w,
      horizontal: 100.w,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius).w,
    ),
    foregroundColor: Color(0xffF0F0F0),
    backgroundColor: Colors.transparent,
    elevation: 0,
    shadowColor: Colors.transparent,
    maximumSize: Size.infinite,
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      color: Color(0xffF0F0F0),
    ),
  ),
);

BottomSheetThemeData bottomSheetTheme = BottomSheetThemeData(
  elevation: 0,
  backgroundColor: Colors.transparent,
  modalBarrierColor: Colors.black.withOpacity(0.7),
);

FloatingActionButtonThemeData floatingActionButtonTheme =
    FloatingActionButtonThemeData(
  backgroundColor: Color(0xff060E18).withOpacity(0.7),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(StyleConstants.buttonBorderRadius).w,
    side: BorderSide(
      color: Color(0xffF0F0F0),
      width: 1.5,
    ),
  ),
);
