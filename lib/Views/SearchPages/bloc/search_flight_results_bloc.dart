import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../Models/API/SearchFlightResultsDTO.dart';
import '../../../Services/OnlineServices.dart';

part 'search_flight_results_event.dart';
part 'search_flight_results_state.dart';

class SearchFlightResultsBloc
    extends Bloc<SearchFlightResultsEvent, SearchFlightResultsState> {
  SearchFlightResultsBloc() : super(SearchFlightResultsInitial()) {
    on<LoadSearchPage>((event, emit) async {
      var futureResults = await getSearchFlightResults(
          event.sourceID, event.destinationID, event.fromDateTime);
      emit(SearchFlightResultsLoaded(results: futureResults));
    });
  }

  Future<List<SearchFlightResultsDTO>> getSearchFlightResults(
      String sourceID, String destionationID, String fromDateTime) async {
    var results = await OnlineService.Instance.getSearchFlightResults(
        sourceID, destionationID, fromDateTime);

    return results;
  }
}
