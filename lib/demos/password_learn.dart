import 'package:flutter/material.dart';

class PassswordTextField extends StatefulWidget {
  const PassswordTextField({Key? key}) : super(key: key);

  @override
  State<PassswordTextField> createState() => _PassswordTextFieldState();
}

class _PassswordTextFieldState extends State<PassswordTextField> {
  bool _isSecure = true;

  void changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextField(
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword,
        obscureText:
            _isSecure, // girilen password değerini göstermemeye yarıyorç.
        obscuringCharacter: '#',
        decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            hintText: 'Password',
            suffix: IconButton(
              onPressed: () {
                changeLoading();
              },
              icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
            )),
      ),
    );
  }
}
