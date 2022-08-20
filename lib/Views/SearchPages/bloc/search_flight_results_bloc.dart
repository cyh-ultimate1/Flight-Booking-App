import 'dart:collection';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Models/API/SearchFlightResultsDTO.dart';
import '../../../Services/OnlineServices.dart';

part 'search_flight_results_event.dart';
part 'search_flight_results_state.dart';

class SearchFlightResultsBloc
    extends Bloc<SearchFlightResultsEvent, SearchFlightResultsState> {
  int kLimit = 10;
  SearchFlightResultsBloc() : super(SearchFlightResultsInitial()) {
    on<LoadSearchPage>((event, emit) async {
      var futureResults = await getSearchFlightResults(
        event.sourceID,
        event.destinationID,
        event.fromDateTime,
        limit: kLimit,
        excludingIds: event.excludingIds,
      );
      emit(SearchFlightResultsLoaded(
        results: futureResults,
      ));
    });

    on<LoadMore>((event, emit) async {
      var futureResults = await getSearchFlightResults(
        event.sourceID,
        event.destinationID,
        event.fromDateTime,
        limit: kLimit,
        excludingIds: event.excludingIds,
      );
      if (state is SearchFlightResultsLoaded) {
        var s = state as SearchFlightResultsLoaded;
        emit(s.copyWith(results: s.results + futureResults));
      }
    });
  }

  Future<List<SearchFlightResultsDTO>> getSearchFlightResults(
      String sourceID, String destionationID, String fromDateTime,
      {int? limit, List<String>? excludingIds}) async {
    var results = await OnlineService.Instance.getSearchFlightResults(
      sourceID,
      destionationID,
      fromDateTime,
      limit: limit,
      excludingIds: excludingIds,
    );

    return results;
  }
}
