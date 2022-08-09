import 'package:flutter/material.dart';
import 'package:project_a/CustomWidgets/customWidgets.dart';

import 'HomeEntryPage.dart';

class PaymentCompletedPage extends StatelessWidget {
  PaymentCompletedPage({Key? key}) : super(key: key);
  var pageBackgroundColor = Color.fromARGB(255, 0, 26, 85);

  @override
  Widget build(BuildContext context) {
    var screenFullWidth = MediaQuery.of(context).size.width;
    var screenFullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: screenFullHeight,
          width: screenFullWidth,
          color: pageBackgroundColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                height: 100,
                color: pageBackgroundColor,
                child: Text(
                  "Congratulations, here is your boarding pass !",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
              customWidgets.emptyHorizontalSpace(customHeight: 50),
              Container(
                height: 450,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name:",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        "data",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              customWidgets.emptyHorizontalSpace(customHeight: 50),
              customWidgets.customLabelButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeEntryPage()),
                        (r) => false);
                  },
                  customLabel: "back to home"),
            ],
          ),
        ),
      ]),
    );
  }
}
