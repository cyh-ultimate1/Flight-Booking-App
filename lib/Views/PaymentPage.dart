import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_a/CustomWidgets/customWidgets.dart';
import 'package:project_a/Models/API/BookingDTO.dart';
import 'package:project_a/Views/EmptyPage.dart';
import 'package:slider_button/slider_button.dart';

import '../CustomMethods.dart';
import '../CustomWidgets/CustomFormTextField.dart';
import '../Services/OnlineServices.dart';
import '../constants.dart';
import 'PaymentCompletedPage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage(
      {Key? key, required this.selectedSeat, required this.flightID})
      : super(key: key);
  final int selectedSeat;
  final String flightID;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  var pageBackgroundColor = Color.fromARGB(255, 0, 26, 85);
  var amount = 55.6;

  Function _onSlide() => () {
        // if (_formKey.currentState!.validate()) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => PaymentCompletedPage(boardingPassNumber: ,)),
        //   );
        // } else {
        //   setState(() {});
        // }
      };

  @override
  Widget build(BuildContext context) {
    var screenFullWidth = MediaQuery.of(context).size.width;
    var screenFullHeight = MediaQuery.of(context).size.height;
    var customBackgroundColor = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalConstants.customLinearGradient,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: screenFullHeight,
              width: screenFullWidth,
              decoration: BoxDecoration(
                  color: customBackgroundColor,
                  gradient: GlobalConstants.customLinearGradient),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "selected seat: ${widget.selectedSeat}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Pay Amount",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$$amount",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  ),
                  customWidgets.emptyHorizontalSpace(customHeight: 5.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 20.0,
                        sigmaY: 20.0,
                      ),
                      child: Container(
                          width: 360,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white.withOpacity(0.2),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Card',
                                        style: TextStyle(
                                            color: Colors.white
                                                .withOpacity(0.75))),
                                    Icon(
                                      Icons.credit_card_sharp,
                                      color: Colors.white.withOpacity(0.75),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('TL Templates',
                                        style: TextStyle(
                                            color: Colors.white
                                                .withOpacity(0.75))),
                                    Text('07/25',
                                        style: TextStyle(
                                            color: Colors.white
                                                .withOpacity(0.75))),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('1234 5678 1011 1213',
                                        style: TextStyle(
                                            color: Colors.white
                                                .withOpacity(0.75))),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: 150,
                      color: Colors.blue.withOpacity(0.0),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          physics: BouncingScrollPhysics(),
                          children: [
                            CustomTextFormField(
                              textLabel: "Card Number:",
                              validator: (val) {
                                return CustomMethods.isEmptyOrNull(val);
                              },
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: screenFullWidth,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          customWidgets.customLabelButton(
                              customLabel: "submit",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  createBooking()
                                      .then((value) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentCompletedPage(
                                                        boardingPassNumber:
                                                            value)),
                                          ));
                                }
                              }),
                          // SliderButton(
                          //   action: () {
                          //     _formKey.currentState!.validate();
                          //   },

                          //   ///Put label over here
                          //   label: const Text(
                          //     "Slide to confirm",
                          //     style: TextStyle(
                          //         color: Color(0xff4a4a4a),
                          //         fontWeight: FontWeight.w500,
                          //         fontSize: 20),
                          //   ),
                          //   icon: const Center(
                          //       child: Icon(
                          //     Icons.keyboard_double_arrow_right_rounded,
                          //     color: Colors.white,
                          //     size: 35.0,
                          //     semanticLabel:
                          //         'Text to announce in accessibility modes',
                          //   )),

                          //   ///Change All the color and size from here.
                          //   width: 250,
                          //   height: 69,
                          //   radius: 10,
                          //   buttonColor: Colors.orange,
                          //   backgroundColor: Color.fromARGB(255, 163, 231, 230),
                          //   highlightedColor: Colors.white,
                          //   baseColor: Colors.black,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Future<String> createBooking() async {
    var results =
        await OnlineService.Instance.createBooking(widget.flightID, "1234");
    return results;
  }
}
