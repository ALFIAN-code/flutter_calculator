import 'package:flutter/material.dart';
import 'package:flutter_calculator/style/style.dart';
import 'package:flutter_calculator/style/theme_database.dart';
import 'package:hive/hive.dart';

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var database = Hive.box('themeData');
  var appColor = AppColor();
  ThemeDatabase theme = ThemeDatabase();

  @override
  void initState() {
    super.initState();
    if (database.get('isDark') == null) {
      theme.initializeFirstData();
    } else {
      theme.loadTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: appColor.background,
          child: Center(
              child: GestureDetector(
            onTap: () {
              setState(() {
                appColor.changeTheme();
              });
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: appColor.primary,
                child: Text('is Dark = ${theme.isDark}')),
          )),
        ),
      ),
    );
  }
}
