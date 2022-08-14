import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_a/Models/API/SearchFlightResultsDTO.dart';

import '../Models/API/LocationIdNameDTO.dart';
import '../Models/API/LoginResponseDTO.dart';
import '../constants.dart';

class CustomHttpClient extends http.BaseClient {
  final http.Client _inner;
  final headersTemplate = {
    "Accept": "application/json",
    "content-type": "application/json"
  };

  CustomHttpClient(this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(headersTemplate);
    return _inner.send(request);
  }
}

class OnlineService {
  static final OnlineService _instance = OnlineService();
  static OnlineService get Instance {
    return _instance;
  }

  static late CustomHttpClient? _client = null;
  static CustomHttpClient get Client {
    return _client ?? (_client = new CustomHttpClient(new http.Client()));
  }

  static const secureStorage = FlutterSecureStorage();

  Future<LoginResponse?> loginUser(String username, String password) async {
    LoginResponse? loginResponse;
    try {
      var resp = await Client.post(
              Uri.parse(GlobalConstants.API_SESSION + 'login'),
              body: jsonEncode({"username": username, "password": password}))
          .timeout(const Duration(minutes: 10));
      if (resp.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(resp.body);
        loginResponse = LoginResponse.fromJson(userMap);
      }
    } catch (ex) {}
    return loginResponse;
  }

  Future<Map<String, String>> getLocationsIdNamePair() async {
    Map<String, String> maps = {};
    try {
      String? jwtToken = await secureStorage.read(key: GlobalConstants.jwt);
      var resp = await Client.get(
        Uri.parse(
            GlobalConstants.API_URL + "/Locations/GetLocationsIdNamePair"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": 'Bearer ' + jwtToken.toString().replaceAll('"', '')
        },
      );
      if (resp.statusCode == 200) {
        Map<String, dynamic> respBody = jsonDecode(resp.body);
        maps = respBody.map((key, value) => MapEntry(key, value));
        //maps = jsonDecode(resp.body).cast<Map<String, String>>();
      }
    } catch (ex) {
      //
      log(ex.toString());
    }
    return maps;
  }

  Future<Map<String, String>> getLocationCitiesIdNamePair() async {
    Map<String, String> maps = {};
    try {
      String? jwtToken = await secureStorage.read(key: GlobalConstants.jwt);
      var resp = await Client.get(
        Uri.parse(
            GlobalConstants.API_URL + "/Locations/GetLocationCitiesIdNamePair"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": 'Bearer ' + jwtToken.toString().replaceAll('"', '')
        },
      );
      if (resp.statusCode == 200) {
        Map<String, dynamic> respBody = jsonDecode(resp.body);
        maps = respBody.map((key, value) => MapEntry(key, value));
        //maps = jsonDecode(resp.body).cast<Map<String, String>>();
      }
    } catch (ex) {
      //
      log(ex.toString());
    }
    return maps;
  }

  Future<List<SearchFlightResultsDTO>> getSearchFlightResults(
      String sourceID, String destinationID, String fromDateTime) async {
    String? jwtToken = await secureStorage.read(key: GlobalConstants.jwt);
    var resp = await Client.post(
        Uri.parse(GlobalConstants.API_URL + "/Flight/GetFlightsByFromToPair"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": 'Bearer ' + jwtToken.toString().replaceAll('"', '')
        },
        body: jsonEncode({
          "SourceID": sourceID,
          "DestinationID": destinationID,
          "FromDateTime": fromDateTime,
        }));
    if (resp.statusCode == 200) {
      var parsed = jsonDecode(resp.body) as List;
      var results =
          parsed.map((json) => SearchFlightResultsDTO.fromJson(json)).toList();

      return results;
    }

    return List.filled(
        0, SearchFlightResultsDTO("", "", DateTime.now(), DateTime.now()));
  }
}
