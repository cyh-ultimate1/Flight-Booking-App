// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchFlightResultsDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFlightResultsDTO _$SearchFlightResultsDTOFromJson(
        Map<String, dynamic> json) =>
    SearchFlightResultsDTO(
      json['sourceID'] as String,
      json['destinationID'] as String,
      json['fromDateTime'] == null
          ? null
          : DateTime.parse(json['fromDateTime'] as String),
      json['toDateTime'] == null
          ? null
          : DateTime.parse(json['toDateTime'] as String),
    )
      ..ObjectID = json['objectID'] as String?
      ..IdentifierNumber = json['identifierNumber'] as String?
      ..ObjectName = json['objectName'] as String?;

Map<String, dynamic> _$SearchFlightResultsDTOToJson(
        SearchFlightResultsDTO instance) =>
    <String, dynamic>{
      'objectID': instance.ObjectID,
      'identifierNumber': instance.IdentifierNumber,
      'objectName': instance.ObjectName,
      'sourceID': instance.sourceID,
      'destinationID': instance.destinationID,
      'fromDateTime': instance.fromDateTime?.toIso8601String(),
      'toDateTime': instance.toDateTime?.toIso8601String(),
    };
