// ignore: file_names
import 'package:flutter/material.dart';
import 'package:project_a/Views/SearchPages/SearchFlight.dart';

import '../CustomWidgets/CustomHorizontalScrollView.dart';
import '../CustomWidgets/CustomRoundedIcons.dart';
import '../CustomWidgets/TitleWithMoreButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kIconSize = 70.0;
    var kIconColor = Colors.white;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.airplane_ticket),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleWithMoreButton(title: "OPTIONS", press: () {}),
            CustomHorizontalScrollView(
              widgets: [
                CustomRoundedIcons(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchFlightPage(),
                        ),
                      );
                    },
                    iconWidget: Icon(
                      Icons.airplanemode_active,
                      size: kIconSize,
                      color: kIconColor,
                    )),
                CustomRoundedIcons(
                    iconWidget: Icon(
                  Icons.add_alarm,
                  size: kIconSize,
                  color: kIconColor,
                )),
                CustomRoundedIcons(
                    iconWidget: Icon(
                  Icons.add_alarm,
                  size: kIconSize,
                  color: kIconColor,
                )),
                CustomRoundedIcons(
                    iconWidget: Icon(
                  Icons.add_alarm,
                  size: kIconSize,
                  color: kIconColor,
                )),
                CustomRoundedIcons(
                    iconWidget: Icon(
                  Icons.add_alarm,
                  size: kIconSize,
                  color: kIconColor,
                )),
                CustomRoundedIcons(
                    iconWidget: Icon(
                  Icons.mic_rounded,
                  size: kIconSize,
                  color: kIconColor,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
