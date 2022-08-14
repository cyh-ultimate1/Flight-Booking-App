import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_a/Views/EmptyPage.dart';

import '../CustomMethods.dart';
import '../CustomWidgets/CustomFormTextField.dart';
import '../../CustomWidgets/customWidgets.dart';
import 'FlightSeatSelectionPage.dart';

class FlightDetailsFormPage extends StatefulWidget {
  const FlightDetailsFormPage({Key? key, required this.flightObjectId})
      : super(key: key);
  final String flightObjectId;

  @override
  State<FlightDetailsFormPage> createState() => _FlightDetailsFormPageState();
}

class _FlightDetailsFormPageState extends State<FlightDetailsFormPage> {
  final _formKey = GlobalKey<FormState>();
  final customBackgroundColor = const Color.fromRGBO(0, 48, 160, 1);
  var customLinearGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(0, 48, 160, 1),
      Colors.lightBlue,
    ],
  );

  Function() _submit() => () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FlightSeatSelectionPage()),
          );
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: customBackgroundColor, gradient: customLinearGradient),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Your Personal Details",
                style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              customWidgets.emptyHorizontalSpace(customHeight: 30.0),
              Container(
                height: 600,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Form(
                    key: _formKey,
                    child: ListView(children: [
                      CustomTextFormField(
                        textLabel: "Your Name:",
                        validator: (val) {
                          return CustomMethods.isEmptyOrNull(val);
                        },
                      ),
                      CustomTextFormField(
                        textLabel: "Your Passport Number:",
                        validator: (val) => CustomMethods.isEmptyOrNull(val),
                      ),
                      customWidgets.emptyHorizontalSpace(customHeight: 200.0),
                      customWidgets.customLabelButton(
                        customLabel: "Submit",
                        onPressed: _submit(),
                        buttonStyle: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
