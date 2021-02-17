import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<CurrencyModel> currencies;
  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController({this.fromText, this.toText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double convertedValue = 0;

    if (toCurrency.name == 'Real') {
      convertedValue = value * fromCurrency.real;
    } else if (toCurrency.name == 'Dolar') {
      convertedValue = value * fromCurrency.dolar;
    } else if (toCurrency.name == 'Euro') {
      convertedValue = value * fromCurrency.euro;
    } else if (toCurrency.name == 'Bitcoin') {
      convertedValue = value * fromCurrency.bitcoin;
    }

    toText.text = convertedValue.toStringAsFixed(2);
  }
}
