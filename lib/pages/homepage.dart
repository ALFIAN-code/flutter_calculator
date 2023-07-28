import 'package:flutter/material.dart';
import 'package:flutter_calculator/component/calculator.dart';
import 'package:flutter_calculator/component/theme_switch.dart';
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
    var deviceheight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    theme.loadTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor.background,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),

              // theme toggle
              Center(
                child: ThemeSwitch(
                  isDark: theme.isDark,
                  primaryColor: appColor.primary,
                  secondaryColor: appColor.secondary,
                  onTap: () => setState(() {
                    appColor.changeTheme();
                  }),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),

              // input text
              Align(
                alignment: Alignment.centerRight,
                child:
                    // TextField(
                    //   style: medium22.copyWith(
                    //       color: appColor.textColor.withOpacity(.5)),
                    //   decoration: const InputDecoration(border: InputBorder.none),
                    //   textAlign: TextAlign.right,
                    // )
                    Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Text(
                    '1.000 × 2 + 2 × 2',
                    textAlign: TextAlign.right,
                    style: medium22.copyWith(
                        color: appColor.textColor.withOpacity(0.5)),
                  ),
                ),
              ),

              // result text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        '=',
                        style: semibold26.copyWith(color: appColor.textColor),
                      ),
                    ),
                    Text(
                      '2004',
                      style: semiBold40.copyWith(color: appColor.textColor),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // calculator button
              CalculatorButton(
                textColor: appColor.textColor,
                height: deviceheight * 0.6,
                isDark: theme.isDark,
                primaryColor: appColor.primary,
                secondaryColor: appColor.secondary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
