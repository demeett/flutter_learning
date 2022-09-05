import 'package:flutter/material.dart';

class StatlessLearn extends StatelessWidget {
  const StatlessLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: const [
            ProjectText(text: 'Deemet'),
            ProjectText(text: 'demir'),
            ProjectText(text: 'ddvf'),
            ProjectText(text: 'dsfd'),
            ProjectText(text: 'sds'),
            _CustomContainer()
          ],
        ));
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.purple));
  }
}

class ProjectText extends StatelessWidget {
  const ProjectText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
