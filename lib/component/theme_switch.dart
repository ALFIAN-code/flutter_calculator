import 'package:flutter/material.dart';
import 'package:flutter_calculator/style/style.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch(
      {super.key,
      required this.onTap,
      required this.primaryColor,
      required this.secondaryColor,
      required this.isDark});
  final void Function()? onTap;
  final Color primaryColor;
  final Color secondaryColor;
  final bool isDark;

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  // ThemeDatabase theme = ThemeDatabase();
  AppColor appcolor = AppColor();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 40,
        width: 110,
        decoration: BoxDecoration(
            color: widget.primaryColor,
            borderRadius: BorderRadius.circular(1000)),
        child: Row(
          children: [
            Expanded(
                child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: widget.isDark
                      ? Colors.transparent
                      : widget.secondaryColor),
              child: Icon(
                Icons.light_mode_outlined,
                size: 27,
                color: widget.isDark
                    ? const Color(0xffFBFBFB).withOpacity(0.4)
                    : const Color(0xff373737),
              ),
            )),
            Expanded(
                child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: widget.isDark
                      ? widget.secondaryColor
                      : Colors.transparent),
              child: Icon(
                Icons.dark_mode_outlined,
                size: 27,
                color: widget.isDark
                    ? const Color(0xffFBFBFB)
                    : const Color(0xff373737).withOpacity(0.4),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
