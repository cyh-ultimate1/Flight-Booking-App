import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../Models/KeyValueModel.dart';
import '../../../Services/OnlineServices.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc() : super(SearchPageInitial()) {
    on<LoadSearchPage>((event, emit) async {
      //await Future<void>.delayed(const Duration(seconds: 3));
      var futureLocationsList = await getLocationCitiesIdNamePair();
      emit(SearchPageLoaded(locations: futureLocationsList));
    });
    on<AddSomething>(((event, emit) {
      if (state is SearchPageLoaded) {
        final state = this.state as SearchPageLoaded;
        emit(SearchPageLoaded(
            locations: List.from(state.locations)..add(event.model)));
      }
    }));
  }

  Future<List<KeyValueModel>> getLocationCitiesIdNamePair() async {
    var results = await OnlineService.Instance.getLocationCitiesIdNamePair();
    return results.entries
        .map((e) => KeyValueModel(key: e.key, value: e.value))
        .toList();
  }
}
