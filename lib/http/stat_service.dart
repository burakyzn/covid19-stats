import 'dart:convert';
import 'package:coronavirusstatistics/model/countrystats.dart';
import 'package:http/http.dart' as http;
import 'package:coronavirusstatistics/model/allstats.dart';
import 'package:coronavirusstatistics/model/api.dart';

class StatService {
  final String _serviceUrl = APIs.statsURL;
  
  Future<AllInfo> overview() async {
    var uri;
    var response;
    var parametre = {"global": "stats"};

    try {
      uri = Uri.https(_serviceUrl, "free-api", parametre);
      response = await http.get(uri);
    } catch (e) {
      print(e);
    }

    if (response != null) {
      if (response.statusCode == 200) {
        var overview = json.decode(response.body);

        return AllInfo.fromJson(overview);
      } else {
        throw Exception("Something went wrong");
      }
    }
  }

  Future<CountryInfo> country(String countryCode) async {
      var uri;
      var response;
      var parametre = {"countryTotal": countryCode};

      try {
        uri = Uri.https(_serviceUrl, "free-api", parametre);
        response = await http.get(uri);
      } catch (e) {
        print(e);
      }

      if (response != null) {
        if (response.statusCode == 200) {
          var overview = json.decode(response.body);
          return CountryInfo.fromJson(overview);
        } else {
          throw Exception("Something went wrong");
        }
      }
  }
}
