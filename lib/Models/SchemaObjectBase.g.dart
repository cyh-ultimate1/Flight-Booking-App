// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchemaObjectBase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemaObjectBase _$SchemaObjectBaseFromJson(Map<String, dynamic> json) =>
    SchemaObjectBase(
      ObjectID: json['objectID'] as String?,
      ObjectNumber: json['objectNumber'] as String?,
      ObjectName: json['objectName'] as String?,
    );

Map<String, dynamic> _$SchemaObjectBaseToJson(SchemaObjectBase instance) =>
    <String, dynamic>{
      'objectID': instance.ObjectID,
      'objectNumber': instance.ObjectNumber,
      'objectName': instance.ObjectName,
    };
