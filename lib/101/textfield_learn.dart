import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldViewLearn extends StatefulWidget {
  const TextFieldViewLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldViewLearn> createState() => _TextFieldViewLearnState();
}

class _TextFieldViewLearnState extends State<TextFieldViewLearn> {
  late FocusNode focusNode = FocusNode();
  void showKeyboard() {
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 20,
            buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: 10,
                  width: 20,
                  color: Colors.green[100 * (currentLength ?? 1 ~/ 2)]);
            },
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            inputFormatters: [textInputMethod()],
            textInputAction: TextInputAction.next,
            focusNode: focusNode,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'Mail',
                border: OutlineInputBorder()),
          ),
          TextButton(
              child: const Text('Tıkla'),
              onPressed: () {
                showKeyboard();
              })
        ],
      ),
    );
  }

  TextInputFormatter textInputMethod() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      if (oldValue.text.length.isOdd) {
        return newValue;
      }
      return newValue;
    });
  }
}
