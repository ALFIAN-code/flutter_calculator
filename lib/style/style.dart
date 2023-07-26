import 'package:flutter/material.dart';
import 'package:flutter_calculator/style/theme_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

//light mode color
Color textLight = const Color(0xff373737);
Color bgLight = const Color(0xffF9F9F9);
Color lightBlue = const Color(0xff5ACEFF);
Color justBlue = const Color(0xff79AFFF);

//dark mode Color
Color textDark = const Color(0xffFBFBFB);
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

// theme data for apps

// ThemeData darkTheme = ThemeData(
//   primaryColor: darkestBlue,
//   colorScheme: ColorScheme.dark(
//     background: bgDark,
//     primary: darkestBlue,
//     secondary: darkBlue
//   )

// );

// ThemeData lightTheme = ThemeData(

// );
// ThemeDatabase themeDatabase = ThemeDatabase();
bool isDarkData = Hive.box('themeData').get('isDark');

class AppColor {
  Color primary = isDarkData ? darkestBlue : justBlue;
  Color secondary = isDarkData ? darkBlue : lightBlue;
  Color textClor = isDarkData ? textDark : textLight;
  Color background = isDarkData ? bgDark : bgLight;

  ThemeDatabase database = ThemeDatabase();

  // static Color primary = justBlue;
  // static Color secondary = lightBlue;
  // static Color textClor = textLight;
  // static Color background = bgLight;

  void changeTheme() {
    // To change theme mode
    if (!database.isDark) {
      print('daaaarkkkk');
      primary = darkestBlue;
      secondary = darkBlue;
      textClor = textDark;
      background = bgDark;
    } else {
      print('lightttttttt');
      primary = justBlue;
      secondary = lightBlue;
      textClor = textLight;
      background = bgLight;
    }
    database.switchTheme();
    database.updateTheme();
  }
}
