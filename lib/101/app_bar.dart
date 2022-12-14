import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({Key? key}) : super(key: key);
  final String _title = 'Welcome Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left), //buraya Drawer da koyulabilir.
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mark_email_unread_sharp)),
          // const Center(
          //     child:
          //         CircularProgressIndicator()) //indicator loading için kullanılır.
        ],
      ),
    );
  }
}
