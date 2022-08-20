import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_a/CustomWidgets/customWidgets.dart';
import 'package:project_a/Views/EmptyPage.dart';
import 'package:project_a/Views/PaymentPage.dart';

import 'bloc/flight_seat_bloc.dart';

class FlightSeatSelectionPage extends StatefulWidget {
  const FlightSeatSelectionPage({Key? key}) : super(key: key);

  @override
  State<FlightSeatSelectionPage> createState() =>
      _FlightSeatSelectionPageState();
}

class _FlightSeatSelectionPageState extends State<FlightSeatSelectionPage> {
  var pageBackgroundColor = Color.fromARGB(255, 0, 26, 85);
  var seatSelectorColor = Colors.orange[800];
  int? finalSelectedSeatIndex;

  @override
  Widget build(BuildContext context) {
    var screenFullWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pageBackgroundColor,
        elevation: 0.0,
      ),
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
                    const Text(
                      "Select Your Seat",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Expanded(
                      child: GridView.builder(
                          padding: EdgeInsets.only(right: 15, left: 15),
                          itemCount: 200,
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
                                child: BlocBuilder<FlightSeatBloc,
                                    FlightSeatState>(
                                  builder: (context, state) {
                                    if (state is FlightSeatSelected) {
                                      finalSelectedSeatIndex =
                                          state.selectedIndex;
                                    }
                                    var isSelected =
                                        state is FlightSeatSelected &&
                                            idx == state.selectedIndex;
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: isAlleyway
                                              ? pageBackgroundColor
                                              : isSelected
                                                  ? seatSelectorColor
                                                  : const Color.fromARGB(
                                                      255, 85, 149, 182),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      height: 5,
                                      width: 5,
                                    );
                                  },
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
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Selected Seat",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        child: BlocBuilder<FlightSeatBloc,
                                            FlightSeatState>(
                                          builder: (context, state) {
                                            var selectedIndex = "XX";
                                            if (state is FlightSeatSelected) {
                                              selectedIndex = state
                                                  .selectedIndex
                                                  .toString();
                                            }
                                            return Text(
                                              selectedIndex,
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: customWidgets.customLabelButton(
                                  onPressed: () {
                                    var selected = finalSelectedSeatIndex!;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentPage(
                                                selectedSeat: selected,
                                              )),
                                    );
                                  },
                                  customLabel: "confirm",
                                  buttonStyle: ElevatedButton.styleFrom(
                                      primary: seatSelectorColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 15),
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ))
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
