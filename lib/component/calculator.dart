import 'package:flutter/material.dart';
import 'package:flutter_calculator/component/buttons.dart';
import 'package:flutter_calculator/style/style.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton(
      {super.key,
      required this.textColor,
      required this.height,
      required this.isDark,
      required this.secondaryColor,
      required this.primaryColor});
  final double height;
  final bool isDark;
  final Color textColor;
  final Color primaryColor;
  final Color secondaryColor;

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

  // String numbers(String input) {
  //   if (input != 'AC' ||
  //       input != '=' ||
  //       input != '÷' ||
  //       input != 'x' ||
  //       input != '+' ||
  //       input != '-' ||
  //       input != '%') {}
  //   return input;
  // }

  // bool isOperator(String input) {
  //   if (input == 'AC' ||
  //       input == '=' ||
  //       input == '÷' ||
  //       input == 'x' ||
  //       input == '+' ||
  //       input == '-' ||
  //       input == '%') {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var deviceheight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Container(
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Stack(
        children: [
          // gradient backgrond
          Image.asset(
            isDark
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
                              margin: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                              decoration: BoxDecoration(
                                  color: isDark
                                      ? const Color(0xff050505).withOpacity(.3)
                                      : Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(1000)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    operatorButtons[0],
                                    style:
                                        semibold26.copyWith(color: textColor),
                                  ),
                                  Text(
                                    operatorButtons[1],
                                    style:
                                        semibold26.copyWith(color: textColor),
                                  ),
                                  Text(
                                    operatorButtons[2],
                                    style:
                                        semibold26.copyWith(color: textColor),
                                  )
                                ],
                              ))),

                      // number buttons
                      Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 5, 5),
                            child: GridView.builder(
                              itemCount: 12,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: MyButtons(
                                        textColor: textColor,
                                        text: numberButtons[index],
                                        isDark: isDark),
                                  ),
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
                    margin: const EdgeInsets.fromLTRB(10, 25, 30, 40),
                    decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xff050505).withOpacity(.3)
                            : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(1000)),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  operatorButtons[3],
                                  style: semibold26.copyWith(
                                      color: textColor, fontSize: 30),
                                ),
                                Text(
                                  operatorButtons[4],
                                  style: semibold26.copyWith(
                                      color: textColor, fontSize: 30),
                                ),
                                Text(
                                  operatorButtons[5],
                                  style: semibold26.copyWith(
                                      color: textColor, fontSize: 30),
                                ),
                              ],
                            )
                            // ListView.builder(
                            //   itemCount: 3,
                            //   itemBuilder: (context, index) {
                            //     var i = index + 3;
                            //     return Padding(
                            //       padding:
                            //           const EdgeInsets.symmetric(vertical: 25),
                            //       child: Center(
                            //           child: Text(
                            //         operatorButtons[i],
                            //         style: semibold26.copyWith(
                            //             color: textColor, fontSize: 30),
                            //       )),
                            //     );
                            //   },
                            // ),
                            ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xff050505).withOpacity(.2)
                                    : Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(1000)),
                            child: Center(
                              child: Text(operatorButtons[6],
                                  style: semibold26.copyWith(color: textColor)),
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
    );
  }
}
