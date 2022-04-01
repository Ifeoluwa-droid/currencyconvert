import 'package:flutter/material.dart';
import 'package:simple_calculator/functionality/add-ons.dart';
import 'package:simple_calculator/functionality/currencies.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String inputVal = '';
  List<String> currencyList = [];
  List<String> flags = [];
  List<String> units = [];
  List<CurrencyInfo> currencyInfoList = [];

  void searchCallback(String newVal) {
    setState(() {
      inputVal = newVal;
      print(inputVal);
      List indexes = [];
      currencyList = [];
      flags = [];
      units = [];
      currencyInfoList = [];
      for (String curr in currency) {
        if (curr.toLowerCase().startsWith(inputVal.toLowerCase())) {
          indexes.add(currency.indexOf(curr));
        }
      }
      for (int index in indexes) {
        flags.add(currencyFlags[index]);
        units.add(currencyUnit[index]);
        currencyList.add(currency[index]);
      }
      print(flags);
      print(units);
      print(currencyList.length);
      for (int i = 0; i < flags.length; i++) {
        currencyInfoList.add(CurrencyInfo(
            flag: flags[i], currency: currencyList[i], unit: units[i]));
      }
      print(currencyInfoList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: TextField(
              autofocus: true,
              onChanged: (value) {
                searchCallback(value);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {},
                  ),
                  hintText: 'Search....',
                  border: InputBorder.none),
            )),
          )),
      body: inputVal != ''
          ? ListView.builder(
              itemBuilder: (context, index) {
                return CurrencyCard(
                  currencyFlag: currencyInfoList[index].flag,
                  currency: currencyInfoList[index].currency,
                  currencyUnit: currencyInfoList[index].unit,
                );
              },
              itemCount: currencyInfoList.length,
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return CurrencyCard(
                  currencyFlag: currencyFlags[index],
                  currency: currency[index],
                  currencyUnit: currencyUnit[index],
                );
              },
              itemCount: currencyInfoList.length,
            ),
    );
  }
}
