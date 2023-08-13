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
              // boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.1))],
              borderRadius: BorderRadius.circular(1000),
              // color: isDark
              //     ? const Color(0xff050505).withOpacity(.1)
              //     : Colors.white.withOpacity(.1),
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
