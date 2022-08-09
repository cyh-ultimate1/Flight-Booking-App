import 'package:flutter/material.dart';

class CustomRoundedIcons extends StatelessWidget {
  const CustomRoundedIcons({Key? key, this.iconWidget, this.onTap})
      : super(key: key);
  final double kDefaultPadding = 5.0;
  final Widget? iconWidget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding * 2.5,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.25,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          child: iconWidget,
        ),
      ),
    );
  }
}
