import 'package:json_annotation/json_annotation.dart';
import 'package:project_a/Models/SchemaObjectBase.dart';
part 'SearchFlightResultsDTO.g.dart';

@JsonSerializable()
class SearchFlightResultsDTO extends SchemaObjectBase {
  SearchFlightResultsDTO(
      this.sourceID, this.destinationID, this.fromDateTime, this.toDateTime);

  String sourceID;
  String destinationID;
  DateTime? fromDateTime;
  DateTime? toDateTime;

  // SearchFlightResultsDTO.fromJson(Map<String, dynamic> json)
  //     : SourceID = json['sourceID'],
  //       DestinationID = json['destinationID'];

  factory SearchFlightResultsDTO.fromJson(Map<String, dynamic> json) =>
      _$SearchFlightResultsDTOFromJson(json);
}
