import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:project_a/Models/API/SearchFlightResultsDTO.dart';
import 'package:project_a/Views/FlightDetailsFormPage.dart';
import 'package:project_a/Views/SearchPages/bloc/search_flight_results_bloc.dart';

class SearchFlightResultsPage extends StatefulWidget {
  const SearchFlightResultsPage(
      {Key? key,
      this.selectedValueSearchFrom,
      this.selectedValueSearchTo,
      this.selectedValueFromDateTime})
      : super(key: key);
  final String? selectedValueSearchFrom;
  final String? selectedValueSearchTo;
  final String? selectedValueFromDateTime;

  @override
  State<SearchFlightResultsPage> createState() =>
      _SearchFlightResultsPageState();
}

class _SearchFlightResultsPageState extends State<SearchFlightResultsPage> {
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Loading.....'),
        action: SnackBarAction(
            textColor: Colors.yellow,
            label: 'HIDE',
            onPressed: scaffold.hideCurrentSnackBar),
        //duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        elevation: 10.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Flights Results"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SearchFlightResultsBloc>(
              create: (context) => SearchFlightResultsBloc()
                ..add(LoadSearchPage(
                    sourceID: widget.selectedValueSearchFrom ?? "",
                    destinationID: widget.selectedValueSearchTo ?? "",
                    fromDateTime: widget.selectedValueFromDateTime ?? ""))),
        ],
        child: BlocBuilder<SearchFlightResultsBloc, SearchFlightResultsState>(
          builder: (context, state) {
            if (state is SearchFlightResultsInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SearchFlightResultsLoaded) {
              var results = state.results;
              return NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  final metrics = scrollEnd.metrics;
                  if (metrics.atEdge) {
                    bool isTop = metrics.pixels == 0;
                    if (isTop) {
                      log('At the top');
                    } else {
                      log('At the bottom');
                      _showToast(context);
                      context.read<SearchFlightResultsBloc>().add(LoadMore(
                          sourceID: widget.selectedValueSearchFrom ?? "",
                          destinationID: widget.selectedValueSearchTo ?? "",
                          fromDateTime: widget.selectedValueFromDateTime ?? "",
                          excludingIds:
                              results.map((e) => e.ObjectID!).toList()));
                    }
                  }
                  return true;
                },
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: results.length,
                      itemBuilder: (BuildContext ctx, int idx) {
                        var result = results[idx];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FlightDetailsFormPage(
                                      flightObjectId: result.ObjectID!,
                                    )),
                          ),
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            elevation: 20.0,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(15.0),
                            // ),
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              child: Row(children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.amber,
                                    child: const Icon(
                                      Icons.flight_takeoff_sharp,
                                      size: 50.0,
                                    ),
                                    height: 100,
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Departure:"),
                                          Text(
                                              "${DateFormat.Hms().format(result.fromDateTime!)}"),
                                          const Text("Arrival:"),
                                          Text(
                                              "${DateFormat.Hms().format(result.toDateTime!)}"),
                                        ],
                                      ),
                                    ))
                              ]),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Text("something is wrong");
            }
          },
        ),
      ),
    );
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 100,
        width: 24,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
