part of 'search_flight_results_bloc.dart';

abstract class SearchFlightResultsEvent extends Equatable {
  const SearchFlightResultsEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchPage extends SearchFlightResultsEvent {
  const LoadSearchPage({
    required this.sourceID,
    required this.destinationID,
    required this.fromDateTime,
    this.limit,
    this.excludingIds,
  });
  final String sourceID;
  final String destinationID;
  final String fromDateTime;
  final int? limit;
  final List<String>? excludingIds;

  @override
  List<Object> get props => [];
}

class LoadMore extends SearchFlightResultsEvent {
  const LoadMore({
    required this.sourceID,
    required this.destinationID,
    required this.fromDateTime,
    this.limit,
    this.excludingIds,
  });
  final String sourceID;
  final String destinationID;
  final String fromDateTime;
  final int? limit;
  final List<String>? excludingIds;

  @override
  List<Object> get props => [];
}
