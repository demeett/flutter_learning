import 'package:flutter/material.dart';
import 'package:flutter_learning/product/navigator/navigator_manager.dart';

mixin NavigatorMixin<T extends StatefulWidget> on State<T> {
  NavigatorManager get router => NavigatorManager.instance;
}
