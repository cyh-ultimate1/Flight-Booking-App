import 'package:json_annotation/json_annotation.dart';

import '../SchemaObjectBase.dart';

@JsonSerializable()
class FlightDetailsFormDTO extends SchemaObjectBase {
  FlightDetailsFormDTO({this.passengerName, this.passengerPassport});

  String? passengerName;
  String? passengerPassport;
}
