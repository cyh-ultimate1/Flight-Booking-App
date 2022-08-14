part of 'search_flight_results_bloc.dart';

abstract class SearchFlightResultsEvent extends Equatable {
  const SearchFlightResultsEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchPage extends SearchFlightResultsEvent {
  const LoadSearchPage(
      {required this.sourceID,
      required this.destinationID,
      required this.fromDateTime});
  final String sourceID;
  final String destinationID;
  final String fromDateTime;

  @override
  List<Object> get props => [];
}
