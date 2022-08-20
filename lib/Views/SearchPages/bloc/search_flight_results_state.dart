part of 'search_flight_results_bloc.dart';

abstract class SearchFlightResultsState extends Equatable {
  const SearchFlightResultsState();

  @override
  List<Object> get props => [];
}

class SearchFlightResultsInitial extends SearchFlightResultsState {}

class SearchFlightResultsLoaded extends SearchFlightResultsState {
  final List<SearchFlightResultsDTO> results;
  final bool listHasChanged;

  const SearchFlightResultsLoaded(
      {required this.listHasChanged, required this.results});

  SearchFlightResultsLoaded copyWith(
      {required List<SearchFlightResultsDTO> originalResults,
      required List<SearchFlightResultsDTO> results}) {
    return SearchFlightResultsLoaded(
        listHasChanged: originalResults.length != results.length,
        results: results);
  }

  @override
  List<Object> get props => [results, listHasChanged];
}
