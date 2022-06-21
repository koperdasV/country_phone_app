import 'dart:convert';

import 'package:country_phone_app/model/country.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final client = http.Client();
  final host = 'https://restcountries.com/v3.1/all';

  Future<List<Country>> getCountry(http.Client client) async {
    final response = await client.get(Uri.parse(host));
    return compute(parseCountry, response.body);
  }

  List<Country> parseCountry(String responseBody){
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }
}
