



import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = ' 6C5CBD80-8412-478A-8342-72BAF04CBD84';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {



  Future<String> getCoinData(String dat)async{

    http.Response response = await http.get('https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$apiKey');
    var data;

    if (response.statusCode == 200){
      data = jsonDecode(response.body);
      return data['rate'].toString();
    }
    else{
      print((response.statusCode));
    }

  }
}
