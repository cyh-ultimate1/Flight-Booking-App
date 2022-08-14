// ignore: file_names
import 'package:flutter/material.dart';
import 'package:project_a/CustomWidgets/customWidgets.dart';
import 'package:project_a/Views/SearchPages/SearchFlight.dart';
import 'package:project_a/constants.dart';

import '../CustomWidgets/CustomGlassIcons.dart';
import '../CustomWidgets/CustomHorizontalScrollView.dart';
import '../CustomWidgets/CustomScrollCard.dart';
import '../CustomWidgets/CustomHorizontalScrollTitleWithMoreButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kIconSize = 70.0;
    var kIconColor = Colors.white;
    var kTitleColor = Colors.white;
    var customBackgroundColor = Theme.of(context).primaryColor;

    return Scaffold(
      // backgroundColor:
      //     (Theme.of(context).primaryColor as MaterialColor).shade700,
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.airplane_ticket),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: customBackgroundColor,
            gradient: GlobalConstants.customLinearGradient),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            customWidgets.emptyHorizontalSpace(),
            CustomHorizontalScrollTitleWithMoreButton(
                title: "OPTIONS", press: () {}, textColor: kTitleColor),
            CustomHorizontalScrollView(
              widgets: [
                CustomGlassIcons(
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
                CustomGlassIcons(
                    iconWidget: Icon(
                  Icons.run_circle,
                  size: kIconSize,
                  color: kIconColor,
                )),
                CustomGlassIcons(
                    iconWidget: Icon(
                  Icons.food_bank,
                  size: kIconSize,
                  color: kIconColor,
                )),
                CustomGlassIcons(
                    iconWidget: Icon(
                  Icons.cloud_done,
                  size: kIconSize,
                  color: kIconColor,
                )),
                CustomGlassIcons(
                    iconWidget: Icon(
                  Icons.delivery_dining,
                  size: kIconSize,
                  color: kIconColor,
                )),
                CustomGlassIcons(
                    iconWidget: Icon(
                  Icons.mic_rounded,
                  size: kIconSize,
                  color: kIconColor,
                )),
              ],
            ),
            customWidgets.emptyHorizontalSpace(),
            CustomHorizontalScrollTitleWithMoreButton(
                title: "Promotions", press: () {}, textColor: kTitleColor),
            CustomHorizontalScrollView(
              widgets: [
                CustomScrollCard(
                  imagePath: "assets/images/img2.jpg",
                  textDescription: "this is awesome !!!",
                ),
                CustomScrollCard(),
                CustomScrollCard(),
                CustomScrollCard(),
                CustomScrollCard(),
              ],
            ),
            customWidgets.emptyHorizontalSpace(),
            CustomHorizontalScrollTitleWithMoreButton(
                title: "Promotions 2", press: () {}, textColor: kTitleColor),
            CustomHorizontalScrollView(
              widgets: [
                CustomScrollCard(
                  imagePath: "assets/images/img2.jpg",
                  textDescription: "this is awesome !!!",
                ),
                CustomScrollCard(),
                CustomScrollCard(),
                CustomScrollCard(),
                CustomScrollCard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
