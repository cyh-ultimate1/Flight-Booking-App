import 'package:json_annotation/json_annotation.dart';
import 'package:project_a/Models/API/PaymentDTO.dart';

import '../SchemaObjectBase.dart';
part 'BookingDTO.g.dart';

@JsonSerializable()
class BookingDTO extends SchemaObjectBase {
  BookingDTO(this.flightID, this.memberUserID);

  final String? flightID;
  final String? memberUserID;
  //PaymentDTO? Payment;

  Map<String, dynamic> toJson() => _$BookingDTOToJson(this);
}
