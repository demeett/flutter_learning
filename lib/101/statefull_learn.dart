import 'package:flutter/material.dart';

import '../product/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
  // ignore: non_constant_identifier_names

}

class _StatefullLearnState extends State<StatefullLearn> {
  //Hayat buradan belirlenir
  int _countValue = 0;
  int _counterCustom = 0;

  void updateCounter(bool isIncerment) {
    if (isIncerment) {
      _countValue++;
    } else {
      _countValue--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _incrementMethod(),
            _deIncrementMethod(),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                _countValue.toString(),
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            CounterButton()
          ],
        ));
  }

  FloatingActionButton _incrementMethod() {
    print('hello');
    return FloatingActionButton(
      onPressed: () {
        updateCounter(true);
      },
      child: Icon(Icons.add),
    );
  }

  Padding _deIncrementMethod() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: FloatingActionButton(
          onPressed: () {
            updateCounter(false);
          },
          child: Icon(Icons.remove)),
    );
  }
}
