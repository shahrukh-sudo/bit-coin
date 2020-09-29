
import 'dart:io';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {


  String selectCurrancy ='USD';
  CoinData data =CoinData();

String bitCoinValue = '?';
  void getData()async{
   String coin =await data.getCoinData(selectCurrancy);
    setState(() {
     bitCoinValue=coin;
    });

  }



  DropdownButton<String> getDropDownButton() {

    List<DropdownMenuItem<String>> dropdownItems =[];
    for(int i =0; i< currenciesList.length; i++){
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);

    }
    return DropdownButton<String> (
        items: dropdownItems,
        value: selectCurrancy ,
        onChanged: (value){
          setState(() {
            selectCurrancy= value;
            getData();
          });
        }
    );
  }


  CupertinoPicker getCupertino(){
    List<Text> getcupertinoItem = [];
    for(int i=0;i<currenciesList.length;i++){
      String data = currenciesList[i];

      getcupertinoItem.add(Text(data));

    }
   return CupertinoPicker(itemExtent: 30, onSelectedItemChanged: (selectedIndex){
      print(selectedIndex);
    },
      children: getcupertinoItem,
    );

  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                '1 BTC = $bitCoinValue $selectCurrancy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:Platform.isIOS?getCupertino() :getDropDownButton(),
    ),
        ],
      ),
    );
  }
}



