import 'package:flutter/material.dart';

import 'state_manage_learn_view.dart';
abstract class StateLearnViewModel extends State<StateManageLearnView>{
  @override
  void initState() {
    super.initState();
  }

  bool isVisible = true;
  bool isOpacity = true;
  void changeLoading() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }

}