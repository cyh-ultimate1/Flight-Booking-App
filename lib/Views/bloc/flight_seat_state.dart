part of 'flight_seat_bloc.dart';

abstract class FlightSeatState extends Equatable {
  const FlightSeatState();

  @override
  List<Object> get props => [];
}

class FlightSeatInitial extends FlightSeatState {}

class FlightSeatSelected extends FlightSeatState {
  const FlightSeatSelected(this.selectedIndex);

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}
