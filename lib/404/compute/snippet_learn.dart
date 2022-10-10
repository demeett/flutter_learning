import 'package:flutter/material.dart';
class SnippetLearn extends StatefulWidget {
const SnippetLearn({super.key});
@override
State<SnippetLearn> createState() => _SnippetLearnState();
 }
class _SnippetLearnState extends State<SnippetLearn> {
@override
Widget build(BuildContext context) {
return Scaffold(appBar: AppBar(),);
}
}

abstract class ChangeLoading<T extends StatefulWidget> extends State<T> {
bool isLoading = false;
void changeLoading() {
setState(() {
isLoading = !isLoading;
});
}
}