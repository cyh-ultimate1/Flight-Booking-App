import 'package:json_annotation/json_annotation.dart';

import '../SchemaObjectBase.dart';
part 'PaymentDTO.g.dart';

@JsonSerializable()
class PaymentDTO extends SchemaObjectBase {
  PaymentDTO(this.cardNumber);

  final String? cardNumber;

  factory PaymentDTO.fromJson(Map<String, dynamic> json) =>
      _$PaymentDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentDTOToJson(this);
}
