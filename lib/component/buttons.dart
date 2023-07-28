import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_calculator/style/style.dart';

class MyButtons extends StatelessWidget {
  const MyButtons(
      {super.key,
      this.onTap,
      required this.text,
      required this.isDark,
      required this.textColor});
  final String text;
  final bool isDark;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(1000),
      child: InkWell(
        onTap: () => onTap,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            // boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.1))],
            borderRadius: BorderRadius.circular(1000),
            color: isDark
                ? const Color(0xff050505).withOpacity(.3)
                : Colors.white.withOpacity(.3),
          ),
          child: Stack(children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 0),
              child: Container(),
            ),
            Center(
              child: Text(
                text,
                style: semibold26.copyWith(color: textColor),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
