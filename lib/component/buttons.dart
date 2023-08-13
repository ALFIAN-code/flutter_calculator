import 'package:flutter/material.dart';
import 'package:flutter_calculator/component/blur_effect.dart';
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Stack(children: [
              BlurEffect(
                isDark: isDark,
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
      ),
    );
  }
}

class OperatorButton extends StatelessWidget {
  const OperatorButton(
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
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Center(
            child: Text(
              text,
              style: semibold26.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
