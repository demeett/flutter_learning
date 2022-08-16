import 'package:flutter/material.dart';

class PaddingLearnView extends StatelessWidget {
  const PaddingLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ProjectPadding(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.white,
                child: ProjectPadding(                  
                  child: const Text(
                    'data',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              ProjectPadding(               
                child: Container(height: 100, width: 100, color: Colors.white),
              ),
            ],
          ),
        ));
  }
}

class ProjectPadding extends StatelessWidget {
  ProjectPadding({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0), child: child);
  }
}
