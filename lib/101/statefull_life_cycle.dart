import 'package:flutter/material.dart';

class StatfullLifeCycle extends StatefulWidget {
  const StatfullLifeCycle({Key? key, required this.message}) : super(key: key);
// Bu classta müşteri datayı dışardan verdi ve alacağız.
  final String message;
  @override
  State<StatfullLifeCycle> createState() => _StatfullLifeCycleState();
}

class _StatfullLifeCycleState extends State<StatfullLifeCycle> {
  String _message = "";
  late final bool isOdd;
  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    _message = widget.message;
    isOdd = widget.message.length.isOdd;

//short if yazarak bu işi tek satıra düşürdük.
    _message = isOdd ? "Tek" : "Çift";
  }

  void computeUpdate() {
    _message = isOdd ? "Tek" : "Çift";
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    print('alo'); //burada counterı sıfırlamak için kullanabiliriz.
  }

  @override
  // ignore: must_call_super
  void didUpdateWidget(covariant StatfullLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: widget.message.length.isEven
                ? Text('Kelime çift')
                : Text('Kelime tek')),
        body: widget.message.length.isOdd
            ? TextButton(onPressed: () {}, child: Text(_message))
            : ElevatedButton(onPressed: () {}, child: Text(_message)));
  }
}
