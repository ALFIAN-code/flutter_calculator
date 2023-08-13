import 'dart:ui';

import 'package:flutter/material.dart';

class BlurEffect extends StatelessWidget {
  const BlurEffect(
      {super.key,
      // this.height, this.width
      required this.isDark});
  final bool isDark;
  // final int? height;
  // final int? width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: isDark
                      ? [
                          const Color(0xff050505).withOpacity(.3),
                          const Color(0xff050505).withOpacity(.1)
                        ]
                      : [
                          Colors.white.withOpacity(.5),
                          Colors.white.withOpacity(.1)
                        ])),
        )
      ],
    );
  }
}
