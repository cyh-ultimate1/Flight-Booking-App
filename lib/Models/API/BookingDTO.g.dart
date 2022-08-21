// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BookingDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDTO _$BookingDTOFromJson(Map<String, dynamic> json) => BookingDTO(
      json['flightID'] as String?,
      json['memberUserID'] as String?,
    )
      ..ObjectID = json['objectID'] as String?
      ..IdentifierNumber = json['identifierNumber'] as String?
      ..ObjectName = json['objectName'] as String?;

Map<String, dynamic> _$BookingDTOToJson(BookingDTO instance) =>
    <String, dynamic>{
      'objectID': instance.ObjectID,
      'identifierNumber': instance.IdentifierNumber,
      'objectName': instance.ObjectName,
      'flightID': instance.flightID,
      'memberUserID': instance.memberUserID,
    };
