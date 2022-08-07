import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'flight_seat_event.dart';
part 'flight_seat_state.dart';

class FlightSeatBloc extends Bloc<FlightSeatEvent, FlightSeatState> {
  FlightSeatBloc() : super(FlightSeatInitial()) {
    on<FlightSeatSelect>((event, emit) {
      emit(FlightSeatSelected(event.selectedIndex));
    });
  }
}
