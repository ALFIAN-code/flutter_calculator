import 'package:flutter/material.dart';
import 'package:flutter_calculator/component/calculate_function.dart';
import 'package:flutter_calculator/component/theme_switch.dart';
import 'package:flutter_calculator/style/style.dart';
import 'package:flutter_calculator/style/theme_database.dart';
import 'package:hive/hive.dart';

import '../component/buttons.dart';

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
  CalculateFunction _calculateFunction = CalculateFunction();

  final List<String> operatorButtons = [
    'AC',
    '÷',
    '%',
    'x',
    '-',
    '+',
    '=',
  ];

  final List<String> numberButtons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    '←'
  ];

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
                    _calculateFunction.userQuestion,
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

              Container(
                height: deviceheight * .6,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: Stack(
                  children: [
                    // gradient backgrond
                    Image.asset(
                      theme.isDark
                          ? 'lib/asset/background_dark.png'
                          : 'lib/asset/background_light2.png',
                      fit: BoxFit.cover,
                      width: deviceheight * .6,
                    ),

                    // buttons
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                // top side operator
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            20, 25, 20, 10),
                                        decoration: BoxDecoration(
                                            color: theme.isDark
                                                ? const Color(0xff050505)
                                                    .withOpacity(.3)
                                                : Colors.white.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(1000)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            MyButtons(
                                                onTap: () {
                                                  setState(() {
                                                    _calculateFunction
                                                        .clearButton();
                                                  });
                                                },
                                                text: operatorButtons[0],
                                                isDark: theme.isDark,
                                                textColor: appColor.textColor),
                                            MyButtons(
                                                text: operatorButtons[1],
                                                isDark: theme.isDark,
                                                textColor: appColor.textColor),
                                            MyButtons(
                                                text: operatorButtons[2],
                                                isDark: theme.isDark,
                                                textColor: appColor.textColor),
                                          ],
                                        ))),

                                // number buttons
                                Expanded(
                                    flex: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 5, 5),
                                      child: GridView.builder(
                                        itemCount: 12,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 12),
                                            child: MyButtons(
                                                onTap: () {
                                                  // print('tapped');
                                                  setState(() {
                                                    _calculateFunction
                                                            .userQuestion +=
                                                        numberButtons[index];
                                                    print(
                                                        'pertanyaannya ${_calculateFunction.userQuestion}');
                                                  });
                                                },
                                                textColor: appColor.textColor,
                                                text: numberButtons[index],
                                                isDark: theme.isDark),
                                          );
                                        },
                                      ),
                                    ))
                              ],
                            )),

                        // right side operator
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 25, 30, 30),
                              decoration: BoxDecoration(
                                  color: theme.isDark
                                      ? const Color(0xff050505).withOpacity(.3)
                                      : Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(1000)),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: ListView.builder(
                                      itemCount: 3,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var i = index + 3;
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 25),
                                          child: Center(
                                              child: Text(
                                            operatorButtons[i],
                                            style: semibold26.copyWith(
                                                color: appColor.textColor,
                                                fontSize: 30),
                                          )),
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: theme.isDark
                                              ? const Color(0xff050505)
                                                  .withOpacity(.2)
                                              : Colors.white.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(1000)),
                                      child: Center(
                                        child: Text(operatorButtons[6],
                                            style: semibold26.copyWith(
                                                color: appColor.textColor)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
