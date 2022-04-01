import 'package:flutter/material.dart';
import 'package:simple_calculator/networking.dart';
import 'package:simple_calculator/screens/currency_types.dart';
import 'package:simple_calculator/screens/home.dart';
import 'package:simple_calculator/screens/search_currency.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewExchangeRates(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(),
      routes: {
        '/': (context) => Home(),
        '/currency_list': (context) => CurrencyList(),
        '/search_currency': (context) => SearchPage(),
      },
      initialRoute: '/',
    );
  }
}
