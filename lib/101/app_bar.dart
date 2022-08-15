import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({Key? key}) : super(key: key);
  final String _title = 'Welcome Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.mark_email_unread_sharp)),
          // const Center(
          //     child:
          //         CircularProgressIndicator()) //indicator loading için kullanılır.
        ],
      ),
    );
  }
}
