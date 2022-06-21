// ignore_for_file: avoid_print

import 'package:country_phone_app/constants.dart';
import 'package:country_phone_app/model.dart';
import 'package:country_phone_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countryModel = CountryModel();

    return MaterialApp(
      home: NotifierProvider(model: countryModel, child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final maskFormatter = MaskTextInputFormatter(mask: '(###) ###-####');
  final countryModel = CountryModel();

  @override
  void initState() {
    super.initState();
    countryModel.loadCountry();
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<CountryModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Scaffold(
      body: Container(
        color: colorApp,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 80, right: 11),
              child: SizedBox(
                width: 344,
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 160),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: Container(
                          width: 71,
                          height: 48,
                          decoration: BoxDecoration(
                              color: colorBtn,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.language),
                              Text('+1'),
                            ],
                          ),
                        ),
                        splashColor: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.only(top: 60),
                                color: colorApp,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 20, right: 60),
                                      child: SizedBox(
                                        width: 295,
                                        child: Text(
                                          'Country Code',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color.fromRGBO(
                                              244, 245, 255, 0.4),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide.none,
                                          ),
                                          prefixIcon: const Icon(Icons.search),
                                          hintText: 'Search',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: model.country.length,
                                        itemBuilder: (context, index) {
                                          model.showedCountryAtIndex(index);
                                          final country = model.country[index];
                                          return CountryWidget(
                                            icon: country.flags as SvgPicture,
                                            code: '${country.idd}',
                                            countryName: '${country.name}',
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 256,
                    height: 48,
                    child: TextField(
                      inputFormatters: [maskFormatter],
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromRGBO(244, 245, 255, 0.4),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none),
                        hintText: '(123) 123-1234',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          //decode();
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Color.fromRGBO(89, 76, 116, 1),
          size: 32,
        ),
      ),
    );
  }
}

class CountryWidget extends StatelessWidget {
  final String code;
  final String countryName;
  final SvgPicture icon;

  const CountryWidget({
    Key? key,
    required this.code,
    required this.countryName,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey,
        child: SizedBox(
          height: 44,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: icon,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(code),
              ),
              Expanded(
                child: Text(countryName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/**/
