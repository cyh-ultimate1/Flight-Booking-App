part of 'search_page_bloc.dart';

@immutable
abstract class SearchPageState extends Equatable {
  const SearchPageState();

  @override
  List<Object> get props => [];
}

class SearchPageInitial extends SearchPageState {}

class SearchPageLoaded extends SearchPageState {
  final List<KeyValueModel> locations;

  const SearchPageLoaded({required this.locations});

  @override
  List<Object> get props => [locations];
}
