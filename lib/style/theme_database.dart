import 'package:hive/hive.dart';

class ThemeDatabase {
  bool isDark = false;

  var database = Hive.box('themeData');

  void initializeFirstData() {
    database.put('isDark', false);
  }

  void loadTheme() {
    isDark = database.get('isDark');
  }

  void updateTheme() {
    database.put('isDark', isDark);
  }

  void switchTheme() {
    isDark = !isDark;
  }
}
