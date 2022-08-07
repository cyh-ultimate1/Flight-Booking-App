import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_a/Models/API/SearchFlightResultsDTO.dart';
import 'package:project_a/Views/FlightDetailsFormPage.dart';
import 'package:project_a/Views/SearchPages/bloc/search_flight_results_bloc.dart';

class SearchFlightResultsPage extends StatefulWidget {
  const SearchFlightResultsPage(
      {Key? key, this.selectedValueSearchFrom, this.selectedValueSearchTo})
      : super(key: key);
  final String? selectedValueSearchFrom;
  final String? selectedValueSearchTo;

  @override
  State<SearchFlightResultsPage> createState() =>
      _SearchFlightResultsPageState();
}

class _SearchFlightResultsPageState extends State<SearchFlightResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Flights Results"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SearchFlightResultsBloc()
                ..add(LoadSearchPage(
                    sourceID: widget.selectedValueSearchFrom ?? "",
                    destinationID: widget.selectedValueSearchTo ?? ""))),
        ],
        child: BlocBuilder<SearchFlightResultsBloc, SearchFlightResultsState>(
          builder: (context, state) {
            if (state is SearchFlightResultsInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SearchFlightResultsLoaded) {
              var results = state.results;
              return ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
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
                          elevation: 15.0,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(15.0),
                          // ),
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            child: Row(children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.amber,
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
                                        Text(result.fromDateTime.toString()),
                                        Text(result.toDateTime.toString()),
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
