import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/functionality/currencies.dart';

import 'package:http/http.dart' as http;

const String apiKey = '1e3f7a9868-6bc4f009a2-r2bmit';

// const String url = 'https://api.fastforex.io/fetch-multi?from=USD&to=EUR%2CGBP%2CCHF&api_key=$apiKey';



Future<Map> updateExchangeRates() async {
  try {
    for (String currency in currencyUnit) {
      final String url = 'https://api.fastforex.io/fetch-all?from=$currency&api_key=$apiKey';
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200){
        String data = response.body;
        var dataMap = jsonDecode(data);
        exchangeRates[currency] = dataMap['results'];
      } else {
        print(response.statusCode);
      }
    }
  } catch (e) {
    throw e;
  }
  return exchangeRates;
}

void getNewExchangeRates(BuildContext context) async {
    exchangeRates = await updateExchangeRates();
}
