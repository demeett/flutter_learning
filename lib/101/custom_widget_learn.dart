import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({Key? key}) : super(key: key);
  final String title = "Food";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
                child: SizedBox(
                    //Butonları sabit tanımlarız . boyutlandırmak istersek çağıracağımız yerde sizedbox atarız.
                    //width: MediaQuery.of(context).size.width, Sayfanın değerini alma
                    width: 200,
                    height: 50,
                    child: CustomFoodButton(title: title))),
            const SizedBox(height: 100),
            CustomFoodButton(title: title)
          ],
        ));
  }
}

class CustomFoodButton extends StatelessWidget {
  const CustomFoodButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
            shape: const StadiumBorder(),
            onPrimary: Colors.white),
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}

class ColorsUtility {
  final Color redColor = Colors.red;
}
