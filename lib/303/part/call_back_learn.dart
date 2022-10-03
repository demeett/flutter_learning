// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_learning/product/widget/button/answer_button.dart';
import 'package:flutter_learning/product/widget/button/loading_button.dart';

import '../../product/widget/call_back_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  CallBackUser? _callBackUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropDown(
            onUserSelected: (CallBackUser user) {
              print(user.name);
              const Text('hoşdjjd');
            },
          ),
          AnswerButton(
            onNumber: (int number) {
              return number % 3 == 1;
              print(number.toString());
            },
          ),
          LoadingButton(
            title: 'Save',
            onPressed: () {
              return Future.delayed(const Duration(seconds: 1));
            },
          )
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser(this.name, this.id);

//dummy bir deneme methodudur .Servisten method gelmediyse ve denememiz gerekiyosa bunu yaparız.
//TODO Dummy Remove it
  static List<CallBackUser> dummyUsers() {
    return [
      CallBackUser('demet', 1),
      CallBackUser('demir', 2),
    ];
  }

  @override
  bool operator ==(covariant CallBackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
