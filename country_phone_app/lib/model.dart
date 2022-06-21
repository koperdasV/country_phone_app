import 'package:country_phone_app/api/api_client.dart';
import 'package:country_phone_app/model/country.dart';
import 'package:flutter/material.dart';

class CountryModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _country = <Country>[];
  List<Country> get country => List.unmodifiable(_country);

  Future<void> loadCountry() async {
    final countryResponse = await _apiClient.getCountry(ApiClient().client);
    _country.addAll(countryResponse);
    notifyListeners();
  }

  // void onCatsTap(BuildContext context, int index) {
  //   final id = _cats[index].;
  //   Navigator.of(context)
  //       .pushNamed(MainNavigationRouteName.details, arguments: id);
  // }

  void showedCountryAtIndex(int index) {
    if (index < _country.length - 1) return;
    loadCountry();
  }
}
