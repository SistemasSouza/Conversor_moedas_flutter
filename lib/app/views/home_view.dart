import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:conversor_moedas/app/components/currency_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  HomeController homeController;
  final TextEditingController fromText = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(top: 100, right: 30, bottom: 20, left: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 50),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  itens: homeController.currencies,
                  onChanged: (value) {
                    setState(() {
                      homeController.fromCurrency = value;
                    });
                  },
                  controller: fromText,
                ),
                SizedBox(
                  height: 10,
                ),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  itens: homeController.currencies,
                  onChanged: (value) {
                    setState(() {
                      homeController.toCurrency = value;
                    });
                  },
                  controller: toText,
                ),
                SizedBox(
                  height: 50,
                ),
                RaisedButton(
                  color: Colors.amber,
                  onPressed: (() {
                    homeController.convert();
                  }),
                  child: Text('CONVERTER'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
