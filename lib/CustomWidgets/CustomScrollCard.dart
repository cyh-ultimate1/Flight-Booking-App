import 'package:flutter/material.dart';

class CustomScrollCard extends StatelessWidget {
  CustomScrollCard(
      {Key? key,
      this.iconWidget,
      this.onTap,
      this.textDescription,
      this.imagePath})
      : super(key: key);
  final double kDefaultPadding = 25.0;
  final Widget? iconWidget;
  final void Function()? onTap;
  final String? textDescription;
  final String? imagePath;
  final kPrimaryColor = Color.fromARGB(255, 12, 88, 230);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 1.5,
      ),
      width: size.width * 0.7,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 300.0,
              width: double.infinity,
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.asset(
                    imagePath ?? "assets/images/img1.jpg",
                    height: 200.0,
                  ),
                  Text(textDescription?.toString() ?? "empty"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
