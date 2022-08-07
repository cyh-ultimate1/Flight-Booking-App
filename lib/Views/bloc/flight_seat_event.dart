part of 'flight_seat_bloc.dart';

abstract class FlightSeatEvent extends Equatable {
  const FlightSeatEvent();

  @override
  List<Object> get props => [];
}

class FlightSeatSelect extends FlightSeatEvent {
  const FlightSeatSelect(this.selectedIndex);
  final int selectedIndex;

  @override
  List<Object> get props => [];
}
