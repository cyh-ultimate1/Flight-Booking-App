import 'dart:ui';

import 'package:flutter/material.dart';

class CustomGlassIcons extends StatelessWidget {
  const CustomGlassIcons({Key? key, this.iconWidget, this.onTap})
      : super(key: key);
  final double kHorizontalMargin = 12.0, kVerticalMargin = 10.0;
  final Widget? iconWidget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: kHorizontalMargin,
        top: kVerticalMargin,
        bottom: kVerticalMargin,
      ),
      width: size.width * 0.25,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: iconWidget,
            ),
          ),
        ),
      ),
    );
  }
}
