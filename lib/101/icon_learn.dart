import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  const IconLearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hello')),
      body: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.message_outlined,
                  color: Theme.of(context)
                      .colorScheme
                      .background, //theme.of kullanmak önemli çünkü asıl tema beyaza dönerse ona göre rengimiz belirlenecek
                  size: IconSize()
                      .iconSmall) //outlined tarzı kullanmaya özen göster.

              )
        ],
      ),
    );
  }
}

class IconSize {
  final double iconSmall = 40;
}

class IconColors {
  final Color froly = Color(0xffED6140);
}
