import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_a/CustomWidgets/customWidgets.dart';
import 'package:project_a/Views/EmptyPage.dart';

import 'bloc/flight_seat_bloc.dart';

class FlightSeatSelectionPage extends StatefulWidget {
  const FlightSeatSelectionPage({Key? key}) : super(key: key);

  @override
  State<FlightSeatSelectionPage> createState() =>
      _FlightSeatSelectionPageState();
}

class _FlightSeatSelectionPageState extends State<FlightSeatSelectionPage> {
  var pageBackgroundColor = Color.fromRGBO(0, 48, 160, 1);

  @override
  Widget build(BuildContext context) {
    var screenFullWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: pageBackgroundColor),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FlightSeatBloc()),
        ],
        child: Stack(
          children: [
            Container(
                color: pageBackgroundColor,
                child: Column(
                  children: [
                    const Text("data"),
                    Expanded(
                      child: GridView.builder(
                          padding: EdgeInsets.only(right: 15, left: 15),
                          itemCount: 40,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7),
                          itemBuilder: (context, idx) {
                            var isAlleyway = idx % 7 == 3;
                            return GestureDetector(
                              onTap: () {
                                if (!isAlleyway) {
                                  log("tapped: $idx");
                                  context
                                      .read<FlightSeatBloc>()
                                      .add(FlightSeatSelect(idx));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, right: 1, left: 1),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isAlleyway
                                          ? pageBackgroundColor
                                          : Colors.green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 5,
                                  width: 5,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                )),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: screenFullWidth,
                    height: 100,
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Selected Seat",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  height: 60,
                                  child: BlocBuilder<FlightSeatBloc,
                                      FlightSeatState>(
                                    builder: (context, state) {
                                      var selectedIndex = "XX";
                                      if (state is FlightSeatSelected) {
                                        selectedIndex =
                                            state.selectedIndex.toString();
                                      }
                                      return Text(
                                        selectedIndex,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
