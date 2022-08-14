// ignore: file_names
import 'dart:developer';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_a/CustomMethods.dart';
import 'package:project_a/Views/SearchPages/bloc/search_page_bloc.dart';
import '../../CustomWidgets/CustomSearchableDropdownList.dart';
import '../../CustomWidgets/customWidgets.dart';
import '../../constants.dart';
import 'SearchFlightResultsPage.dart';

class SearchFlightPage extends StatefulWidget {
  const SearchFlightPage({Key? key}) : super(key: key);

  @override
  State<SearchFlightPage> createState() => _SearchFlightPageState();
}

class _SearchFlightPageState extends State<SearchFlightPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValueSearchFrom = "";
  String? selectedValueSearchTo = "";
  String? selectedValueFromDateTime = null;

  @override
  void initState() {
    super.initState();
  }

  Function() _submit() {
    return () {
      log("dropdownvalue: " + selectedValueSearchFrom.toString());
      if (_formKey.currentState!.validate()) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchFlightResultsPage(
                    selectedValueSearchFrom: selectedValueSearchFrom,
                    selectedValueSearchTo: selectedValueSearchTo,
                    selectedValueFromDateTime: selectedValueFromDateTime,
                  )),
        );
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    var customBackgroundColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: GlobalConstants.customLinearGradient,
          ),
        ),
        elevation: 0,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SearchPageBloc()..add(LoadSearchPage())),
        ],
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            decoration: BoxDecoration(
                color: customBackgroundColor,
                gradient: GlobalConstants.customLinearGradient),
            //padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Search Your Flight",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                customWidgets.emptyHorizontalSpace(customHeight: 30.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  height: 610,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BlocBuilder<SearchPageBloc, SearchPageState>(
                    builder: (context, state) {
                      if (state is SearchPageInitial) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is SearchPageLoaded) {
                        var locations = state.locations;
                        return Form(
                          key: _formKey,
                          child: ListView(children: [
                            CustomSearchableDropdownList(
                              isRequired: true,
                              customLabelText: "Search From",
                              dropDownItems: locations,
                              onChanged: (value) {
                                selectedValueSearchFrom = value;
                              },
                            ),
                            CustomSearchableDropdownList(
                              isRequired: true,
                              customLabelText: "Search To",
                              dropDownItems: locations,
                              onChanged: (value) {
                                selectedValueSearchTo = value;
                              },
                            ),
                            customWidgets.emptyHorizontalSpace(),
                            DateTimePicker(
                              type: DateTimePickerType.date,
                              // use24HourFormat: false,
                              // locale: Locale('en', 'KE'),
                              initialValue: '',
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              dateLabelText: 'Departure Date',
                              onChanged: (val) =>
                                  selectedValueFromDateTime = val,
                              validator: (val) {
                                return CustomMethods.isDateTimeEmptyOrNull(val);
                              },
                              onSaved: (val) => print(val),
                            ),
                            customWidgets.customLabelButton(
                              customLabel: "search",
                              onPressed: _submit(),
                            ),
                          ]),
                        );
                      } else {
                        return const Text("something is wrong");
                      }
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
