import 'package:flutter/material.dart';



class ReUsableButton extends StatelessWidget {

  String text;
  IconData icon;
  Function onPressed;
  Color color = Colors.black87;

  ReUsableButton({this.text, @required this.onPressed, @required this.color, this.icon});
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      // focusColor: Colors.red,
      // hoverColor: Colors.green,
      // splashColor: Colors.blue,
      onPressed: onPressed,
      child: text == null ? Icon(icon, size: 25, color: color,) : Text(text, style: TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.w400),),
    );
  }
}

class ReUsableColumn extends StatelessWidget {

  String firstString;
  Function firstFunction;
  String secondString;
  Function secondFunction;
  String thirdString;
  Function thirdFunction;
  String fourthString;
  Function fourthFunction;

  ReUsableColumn({
    @required this.firstString,
    @required this.firstFunction,
    @required this.secondString,
    @required this.secondFunction,
    @required this.thirdString,
    @required this.thirdFunction,
    @required this.fourthString,
    @required this.fourthFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Expanded(child: ReUsableButton(text: firstString, onPressed: firstFunction)),
            Expanded(child: ReUsableButton(text: secondString, onPressed: secondFunction)),
            Expanded(child: ReUsableButton(text: thirdString, onPressed: thirdFunction)),
            Expanded(child: ReUsableButton(text: fourthString, onPressed: fourthFunction)),
          ],
        ),
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {

  String currencyFlag;
  String currency;
  String currencyUnit;

  CurrencyCard({@required this.currencyFlag, @required this.currency, @required this.currencyUnit});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, [currencyFlag, currencyUnit, currency]);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 8.0, bottom: 8.0,),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  image: DecorationImage(
                    image: AssetImage('images/$currencyFlag-flag.jpg'),
                    fit: BoxFit.cover,),
                ),),
              SizedBox(width: 20.0),
              Text(currency, style: TextStyle(color: Colors.black87, fontSize: 14.0, fontWeight: FontWeight.w400)),
              SizedBox(width: 10.0,),
              Text(currencyUnit, style: TextStyle(color: Colors.black26, fontSize: 14.0, fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      ),
    );
  }
}



class ReUsableInputTemplate extends StatelessWidget {
  String currencyFlag;
  String currencyUnit;
  String currency;
  String figure;
  bool firstBuild;
  Function inputTemplateCallback;

  ReUsableInputTemplate({@required this.currencyFlag, @required this.currencyUnit, @required this.currency, @required this.figure, @required this.inputTemplateCallback, this.firstBuild});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10,),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      image: DecorationImage(
                        image: AssetImage('images/$currencyFlag-flag.jpg'),
                        fit: BoxFit.cover,),
                    ),),
                  SizedBox(width: 20.0),
                  Text(currencyUnit, style: TextStyle(fontSize: 18.0, color: Colors.black87),),
                  IconButton(
                    icon: Icon(Icons.arrow_drop_down),
                    color: Colors.grey,
                    onPressed: inputTemplateCallback,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              figure,
                              style: TextStyle(color: firstBuild ? Colors.grey : Colors.black87, fontSize: 20,),
                            ),
                          ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(currency, style: TextStyle(color: Colors.grey,),),
                      )
                    ],
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}


