import 'package:flutter/material.dart';
import 'package:flutter_calculator/style/theme_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

//light mode color
Color textLight = const Color(0xff373737);
Color bgLight = const Color(0xffF9F9F9);
Color primaryLight = const Color(0xffA9DCFD);
Color secondaryLight = const Color(0xffD8EEFF);
List<Color> gradientLight = [const Color(0xff5ACEFF), const Color(0xff79AFFF)];

//dark mode Color
Color textDark = const Color(0xffFBFBFB);
Color bgDark = const Color(0xff252628);
Color primaryDark = const Color(0xff1B6A9C);
Color secondaryDark = const Color(0xff003661);
List<Color> gradientDark = [const Color(0xff2A7DA1), const Color(0xff224E91)];

// fonts
TextStyle regular22 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400));
TextStyle medium22 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500));
TextStyle semibold22 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600));

TextStyle regular26 = regular22.copyWith(fontSize: 26);
TextStyle semibold26 = semibold22.copyWith(fontSize: 26);

TextStyle semiBold40 = semibold22.copyWith(fontSize: 40);

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
ThemeDatabase themeDatabase = ThemeDatabase();
// bool isDarkData = Hive.box('themeData').get('isDark');

class AppColor {
  Color primary = themeDatabase.isDark ? primaryDark : primaryLight;
  Color secondary = themeDatabase.isDark ? secondaryDark : secondaryLight;
  List<Color> gradient = themeDatabase.isDark ? gradientDark : gradientLight;
  Color textColor = themeDatabase.isDark ? textDark : textLight;
  Color background = themeDatabase.isDark ? bgDark : bgLight;

  ThemeDatabase database = ThemeDatabase();

  void changeTheme() {
    // To change theme mode
    if (!database.isDark) {
      print('daaaarkkkk');
      primary = primaryDark;
      secondary = secondaryDark;
      gradient = gradientDark;
      textColor = textDark;
      background = bgDark;
    } else {
      print('lightttttttt');
      primary = primaryLight;
      secondary = secondaryLight;
      gradient = gradientLight;
      textColor = textLight;
      background = bgLight;
    }
    database.switchTheme();
    database.updateTheme();
    print(Hive.box('themeData').get('isDark'));
  }
}
