import 'package:flutter/material.dart';

class CustomHorizontalScrollTitleWithMoreButton extends StatelessWidget {
  const CustomHorizontalScrollTitleWithMoreButton({
    Key? key,
    this.title,
    this.press,
    this.textColor,
  }) : super(key: key);
  final String? title;
  final void Function()? press;
  final Color? textColor;
  static const double kDefaultPadding = 20.0;
  // static const kPrimaryColor = Color(0xFF0C9869);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          CustomTitle(
            text: title!.toUpperCase(),
            textColor: textColor,
          ),
          const Spacer(),
          // FlatButton(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   color: kPrimaryColor,
          //   onPressed: press,
          //   child: Text(
          //     "More",
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    this.text,
    this.textColor,
  }) : super(key: key);

  final String? text;
  final Color? textColor;
  static const double kDefaultPadding = 20.0;
  //static const kPrimaryColor = Color(0xFF0C9869);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text!,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  color: textColor),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     margin: EdgeInsets.only(right: kDefaultPadding / 4),
          //     height: 7,
          //     color: kPrimaryColor.withOpacity(0.2),
          //   ),
          // )
        ],
      ),
    );
  }
}
