import 'dart:developer';

import 'package:flutter/material.dart';

//bir ekran olacak
//bu ekranda 3 button ve bunlara basınca renk değişiimi olacak .
//seçili olan button selected icon olsun .

class ColorDemos extends StatefulWidget {
  const ColorDemos({Key? key, required this.colorInitial}) : super(key: key);
  final Color colorInitial;
  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backgroundColor = Colors.transparent;

  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    inspect(widget); //widget  içindekilere bakıyoruz.
    if (widget.colorInitial != _backgroundColor && _backgroundColor != null) {
      changedBackgroundColor(widget.colorInitial);
    }
  }

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.colorInitial;
  }

  void changedBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: ContainerProject(
                colors: Colors.red,
              ),
              label: 'Welcome'),
          BottomNavigationBarItem(
              icon: ContainerProject(
                colors: Colors.yellow,
              ),
              label: 'Welcome2'),
          BottomNavigationBarItem(
              icon: ContainerProject(
                colors: Colors.blue,
              ),
              label: 'Welcome3')
        ],
        onTap: _colorOnTap, //hangi butona tıklandığını tutyor value değeri
      ),
    );
  }

  void _colorOnTap(int value) {
    if (value == MyColors.red.index) {
      changedBackgroundColor(Colors.red);
    } else if (value == MyColors.yellow.index) {
      changedBackgroundColor(Colors.yellow);
    } else if (value == MyColors.blue.index) {
      changedBackgroundColor(Colors.blue);
    }
  }
}

enum MyColors { red, yellow, blue }

class ContainerProject extends StatelessWidget {
  const ContainerProject({Key? key, required this.colors}) : super(key: key);
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return Container(color: colors, child: const Icon(Icons.abc_rounded));
  }
}
