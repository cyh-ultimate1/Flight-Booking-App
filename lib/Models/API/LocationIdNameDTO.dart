class LocationIdNameDTO {
  final String ObjectId;
  final String ObjectName;
  LocationIdNameDTO({required this.ObjectId, required this.ObjectName});

  LocationIdNameDTO.fromJson(Map<String, dynamic> json)
      : ObjectId = json['ObjectId'],
        ObjectName = json['ObjectName'];
}
