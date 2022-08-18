import 'package:flutter/material.dart';

class NavigateDetailLearn extends StatefulWidget {
  const NavigateDetailLearn({Key? key}) : super(key: key);

  @override
  State<NavigateDetailLearn> createState() => _NavigateDetailLearnState();
}

class _NavigateDetailLearnState extends State<NavigateDetailLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop(
                    true); //buraya basıldığı zaman true döndürücek sonuç olarak
              },
              icon: Icon(Icons.check),
              label: Text('Hello'))),
    );
  }
}
