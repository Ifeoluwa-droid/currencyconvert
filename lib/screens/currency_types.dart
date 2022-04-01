import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:simple_calculator/functionality/add-ons.dart';
import 'package:simple_calculator/functionality/currencies.dart';
import 'package:simple_calculator/screens/search_currency.dart';

class CurrencyList extends StatefulWidget {

  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  String inputVal = '';
  List<String> currencyList = [];
  List<String> flags = [];
  List<String> units = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,),
        onPressed: (){
            Navigator.pop(context);
        },),
        title: Text('Currency Converter', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchPage()
                )
              );
               Navigator.pop(context, result);
              }
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Container(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CurrencyCard(
                        currencyFlag: currencyFlags[index],
                        currency: currency[index],
                        currencyUnit: currencyUnit[index],
                      );
                    },
                    itemCount: currency.length,
                  ),
              )),
    );
  }
}



