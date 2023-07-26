import 'dart:ui';
import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  const CalculatorButton(
      {super.key,
      required this.height,
      required this.isDark,
      required this.secondaryColor,
      required this.primaryColor});
  final double height;
  final bool isDark;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Stack(
        children: [
          Image.asset(
            widget.isDark
                ? 'lib/asset/background_dark.png'
                : 'lib/asset/background_light.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),

          // Container(
          //   // height: double.infinity,
          //   color: widget.isDark
          //       ? const Color(0xff2A7DA1)
          //       : const Color(0xff5ACEFF),
          // ),

          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(),
          ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.isDark
                        ? [
                            Colors.black.withOpacity(.3),
                            Colors.black.withOpacity(.1)
                          ]
                        : [
                            Colors.white.withOpacity(.4),
                            Colors.white.withOpacity(.1)
                          ])),
          )
        ],
      ),
    );
  }
}
