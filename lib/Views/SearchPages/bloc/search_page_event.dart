part of 'search_page_bloc.dart';

@immutable
abstract class SearchPageEvent extends Equatable {
  const SearchPageEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchPage extends SearchPageEvent {}

class AddSomething extends SearchPageEvent {
  final KeyValueModel model;

  const AddSomething({required this.model});

  @override
  List<Object> get props => [];
}
