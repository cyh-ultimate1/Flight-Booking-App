part of 'search_flight_results_bloc.dart';

abstract class SearchFlightResultsState extends Equatable {
  const SearchFlightResultsState();

  @override
  List<Object> get props => [];
}

class SearchFlightResultsInitial extends SearchFlightResultsState {}

class SearchFlightResultsLoaded extends SearchFlightResultsState {
  final List<SearchFlightResultsDTO> results;

  const SearchFlightResultsLoaded({required this.results});

  SearchFlightResultsLoaded copyWith(
      {required List<SearchFlightResultsDTO> results}) {
    return SearchFlightResultsLoaded(results: results);
  }

  @override
  List<Object> get props => [results, results.length];
}
