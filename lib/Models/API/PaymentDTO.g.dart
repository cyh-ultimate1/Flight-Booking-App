// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDTO _$PaymentDTOFromJson(Map<String, dynamic> json) => PaymentDTO(
      json['cardNumber'] as String?,
    )
      ..ObjectID = json['objectID'] as String?
      ..IdentifierNumber = json['identifierNumber'] as String?
      ..ObjectName = json['objectName'] as String?;

Map<String, dynamic> _$PaymentDTOToJson(PaymentDTO instance) =>
    <String, dynamic>{
      'objectID': instance.ObjectID,
      'identifierNumber': instance.IdentifierNumber,
      'objectName': instance.ObjectName,
      'cardNumber': instance.cardNumber,
    };
