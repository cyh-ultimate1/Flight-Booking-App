import 'package:json_annotation/json_annotation.dart';
part 'SchemaObjectBase.g.dart';

@JsonSerializable()
class SchemaObjectBase {
  @JsonKey(name: 'objectID')
  String? ObjectID;

  @JsonKey(name: 'identifierNumber')
  String? IdentifierNumber;

  @JsonKey(name: 'objectName')
  String? ObjectName;

  SchemaObjectBase({this.ObjectID, this.IdentifierNumber, this.ObjectName});

  // SchemaObjectBase.fromJson(Map<String, dynamic> json)
  //     : ObjectID = json['objectID'],
  //       ObjectName = json['objectName'],
  //       ObjectNumber = json['objectNumber'];

  factory SchemaObjectBase.fromJson(Map<String, dynamic> json) =>
      _$SchemaObjectBaseFromJson(json);
}
