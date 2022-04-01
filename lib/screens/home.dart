import 'dart:io' show Platform, exit;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:simple_calculator/functionality/currencies.dart';
import '../functionality/add-ons.dart';
import '../functionality/button_functionality.dart';
import '../networking.dart';
import 'currency_types.dart';


class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String firstFigure = '0';
  String secondFigure = '';
  String thirdFigure = '';
  String firstCurrencyFlag = 'unitedarab';
  String secondCurrencyFlag = 'unitedarab';
  String thirdCurrencyFlag = 'unitedarab';
  String firstCurrencyUnit = 'AED';
  String secondCurrencyUnit = 'AED';
  String thirdCurrencyUnit = 'AED';
  String firstCurrency = 'United Arab Emirates Dirham';
  String secondCurrency = 'United Arab Emirates Dirham';
  String thirdCurrency = 'United Arab Emirates Dirham';
  var result;
  bool firstBuild = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void convertCurrency (Map rates){
    secondFigure = (double.parse(firstFigure) * rates[firstCurrencyUnit][secondCurrencyUnit]).toStringAsFixed(2);
    thirdFigure = (double.parse(firstFigure) * rates[firstCurrencyUnit][thirdCurrencyUnit]).toStringAsFixed(2);
  }


  Future<void> buttonEvent(String buttonString) async {
    if (firstFigure.length == 12) {
      final snackBar = SnackBar(content: Text('Maximum number of input digits reached!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
         if (exchangeRates.isEmpty) {
           try {
             exchangeRates = await updateExchangeRates();
             setState(() {
               firstFigure += buttonFunction[buttonString];
               convertCurrency(exchangeRates);
               firstBuild = false;
             });
           } catch (e) {
             final snackBar = SnackBar(content: Text('Check internet connection!'));
             ScaffoldMessenger.of(context).showSnackBar(snackBar);
           }
         } else {
           setState(() {
             firstFigure += buttonFunction[buttonString];
             convertCurrency(exchangeRates);
             firstBuild = false;
           });
         }
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.greenAccent),
        onPressed: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
        }),
        title: Text("Currency Converter", style: TextStyle(color: Colors.black)),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert, color: Colors.greenAccent,),
              onSelected: (value) async {
                if (value == 0){
                  try {
                    exchangeRates = await updateExchangeRates();
                    final snackBar = SnackBar(content: Text('Exchange rates updated!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } catch (e) {
                    final snackBar = SnackBar(content: Text('Update failed! check your internet connection!'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Text('Update Exchange'),
                  textStyle: TextStyle(
                      color: Colors.black
                  ),
                )
              ]
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [Container(
            height: 680, ///some height
            child: Column(
              children: [
                Expanded(flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ReUsableInputTemplate(currencyFlag: firstCurrencyFlag, currencyUnit: firstCurrencyUnit, currency: firstCurrency, figure: firstFigure, firstBuild: firstBuild, inputTemplateCallback:  () async {
                              result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return CurrencyList();
                              }));
                              if (result != []) { // [currencyFlag, currencyUnit, currency, identity]
                                if (exchangeRates.isNotEmpty) {
                                  setState(() {
                                    firstCurrencyFlag = result[0];
                                    firstCurrencyUnit = result[1];
                                    firstCurrency = result[2];
                                    convertCurrency(exchangeRates);
                                  });
                                } else {
                                  setState(() {
                                    firstCurrencyFlag = result[0];
                                    firstCurrencyUnit = result[1];
                                    firstCurrency = result[2];
                                  });
                                }
                              }
                            },),
                            ReUsableInputTemplate(currencyFlag: secondCurrencyFlag, currencyUnit: secondCurrencyUnit, currency: secondCurrency, figure: secondFigure, firstBuild: false, inputTemplateCallback:  () async {
                              result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return CurrencyList();
                              }));
                              if (result != []) { // [currencyFlag, currencyUnit, currency, identity]
                                if (exchangeRates.isNotEmpty) {
                                  setState(() {
                                    secondCurrencyFlag = result[0];
                                    secondCurrencyUnit = result[1];
                                    secondCurrency = result[2];
                                    convertCurrency(exchangeRates);
                                  });
                                } else {
                                  setState(() {
                                    secondCurrencyFlag = result[0];
                                    secondCurrencyUnit = result[1];  
                                    secondCurrency = result[2];
                                  });
                                }
                              }
                            },),
                            ReUsableInputTemplate(currencyFlag: thirdCurrencyFlag, currencyUnit: thirdCurrencyUnit, currency: thirdCurrency, figure: thirdFigure, firstBuild: false, inputTemplateCallback:  () async {
                              result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return CurrencyList();
                              }));
                              print(result);
                              print(firstFigure);
                              if (result != []) { // [currencyFlag, currencyUnit, currency, identity]
                                if (exchangeRates.isNotEmpty) {
                                  setState(() {
                                    thirdCurrencyFlag = result[0];
                                    thirdCurrencyUnit = result[1];
                                    thirdCurrency = result[2];
                                    convertCurrency(exchangeRates);
                                  });
                                } else {
                                  setState(() {
                                    thirdCurrencyFlag = result[0];
                                    thirdCurrencyUnit = result[1];
                                    thirdCurrency = result[2];
                                  });
                                }
                              }
                            },),
                          ],
                        ),

                      ),
                    )),
                Expanded(flex: 2, child: Container(color: Colors.white)),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: Row(
                      children: [
                        ReUsableColumn(firstString: "7", firstFunction: () async { await buttonEvent("7");}, secondString: "4", secondFunction: () async { await buttonEvent("4");}, thirdString: "1", thirdFunction: () async { await buttonEvent("1");}, fourthString: ".", fourthFunction: () async { await buttonEvent(".");},),
                        ReUsableColumn(firstString: "8", firstFunction: () async { await buttonEvent("8");}, secondString: "5", secondFunction: () async { await buttonEvent("5");}, thirdString: "2", thirdFunction: () async { await buttonEvent("2");}, fourthString: "0", fourthFunction: () async { await buttonEvent("0");},),
                        ReUsableColumn(firstString: "9", firstFunction: () async { await buttonEvent("9");}, secondString: "6", secondFunction: () async { await buttonEvent("6");}, thirdString: "3", thirdFunction: () async { await buttonEvent("3");}, fourthString: "00", fourthFunction: () async { await buttonEvent("00");},),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: ReUsableButton(text: "AC", onPressed: () {
                                setState(() {
                                  firstFigure = '0';
                                  secondFigure = '';
                                  thirdFigure = '';
                                });
                              }, color: Colors.greenAccent)),
                              Expanded(child: ReUsableButton(icon: Icons.clear, onPressed: () {
                                setState(() {
                                  firstFigure = firstFigure != '0' ? firstFigure.substring(0, firstFigure.length-1) : '0';
                                  convertCurrency(exchangeRates);
                                });
                              }, color: Colors.greenAccent)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),]
        ),
      ),
    );
  }
}
