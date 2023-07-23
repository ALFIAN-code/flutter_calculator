import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//light mode color
Color bgLight = const Color(0xffF9F9F9);
Color lightBlue = const Color(0xff5ACEFF);
Color justBlue = const Color(0xff79AFFF);

//dark mode Color
Color bgDark = const Color(0xff252628);
Color darkBlue = const Color(0xff2A7DA1);
Color darkestBlue = const Color(0xff2A7DA1);

// fonts
TextStyle regular22 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400));
TextStyle bold22 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700));

TextStyle regular26 = regular22.copyWith(fontSize: 26);
TextStyle bold26 = bold22.copyWith(fontSize: 26);

TextStyle bold40 = bold22.copyWith(fontSize: 40);

class AppColor {
  static Color bgColor = bgLight;
  static Color primary1 = lightBlue;
  static Color primary2 = justBlue;

  static void switchMode() {}
}
