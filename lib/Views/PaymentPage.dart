import 'package:flutter/material.dart';
import 'package:project_a/CustomWidgets/customWidgets.dart';
import 'package:project_a/Views/EmptyPage.dart';
import 'package:slider_button/slider_button.dart';

import '../CustomMethods.dart';
import '../CustomWidgets/CustomFormTextField.dart';
import 'PaymentCompletedPage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  var pageBackgroundColor = Color.fromARGB(255, 0, 26, 85);
  var amount = 55.6;

  Function _onSlide() => () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentCompletedPage()),
          );
        } else {
          setState(() {});
        }
      };

  @override
  Widget build(BuildContext context) {
    var screenFullWidth = MediaQuery.of(context).size.width;
    var screenFullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: pageBackgroundColor,
        ),
        body: Stack(
          children: [
            Container(
              height: screenFullHeight,
              width: screenFullWidth,
              color: pageBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Pay Amount",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$$amount",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 150,
                    color: Colors.blue.withOpacity(0.0),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Form(
                      key: _formKey,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentCompletedPage()),
                                );
                              }
                            }),
                        SliderButton(
                          action: () {
                            _formKey.currentState!.validate();
                          },

                          ///Put label over here
                          label: const Text(
                            "Slide to confirm",
                            style: TextStyle(
                                color: Color(0xff4a4a4a),
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          icon: const Center(
                              child: Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            color: Colors.white,
                            size: 35.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          )),

                          ///Change All the color and size from here.
                          width: 250,
                          height: 69,
                          radius: 10,
                          buttonColor: Colors.orange,
                          backgroundColor: Color.fromARGB(255, 163, 231, 230),
                          highlightedColor: Colors.white,
                          baseColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
