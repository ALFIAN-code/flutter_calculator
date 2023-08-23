import 'package:hive/hive.dart';

class ThemeDatabase {
  bool isDark = (Hive.box('themeData').isEmpty)?false:Hive.box('themeData').get('isDark');

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
