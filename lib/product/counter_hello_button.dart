import 'package:flutter/material.dart';
import 'package:flutter_learning/product/language/language_learn.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({Key? key}) : super(key: key);

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counterCustom = 0;
  void updateCounterCustom() {
    _counterCustom++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            updateCounterCustom();
          },
          child: Text(LanguageItems.title + _counterCustom.toString())),
    );
  }
}
