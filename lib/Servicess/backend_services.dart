import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:voltro_dxb/models/country_model.dart';
import 'package:voltro_dxb/utils/constants.dart';

class BackendService {
  static List<Country> det = [];
  static CountriesList contResponse;

  static Future<Map> _getJson() async {
    String apiUrl = '${Constants.baseUrl}summary';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      //'X-Access-Token': '5cf9dfd5-3449-485e-b5ae-70a60e997864',
    };

    http.Response response = await http.get(
      apiUrl,
      headers: headers,
    );
    bool responseCode = false;

    if (response.statusCode == 200) {
      print('success');
    } else {
      responseCode = false;

      print('Something Went Wrong');
    }

    return json.decode(response.body);
  }

  static Future<List<Country>> getCountries() async {
    try {
      Map _data = await _getJson();
      contResponse = CountriesList.fromJson(_data);
      det = contResponse.countries;

      return contResponse.countries;
    } catch (e) {
      print(e);
    }
  }

  static totalGlobalConfirmed() async {
    String globalConfirmed = '';
    Map _data = await _getJson();
    contResponse = CountriesList.fromJson(_data);

    globalConfirmed = contResponse.global.totalConfirmed.toString();

    return globalConfirmed;
  }
}
