import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        //yapıyı form ile sarmalarız çünkü boş bırakıldığı zamanki dönüüşü görmesini sağlar.
        key: _key, //key ile form içindekileri çekip kontrol edebiliriz.
        autovalidateMode: AutovalidateMode
            .always, //tuşa basmadan otomatik return yazısının dönmesini sağlayan yapı//ama buradaki sorun bütün formu etkilediği için bir tane daha
        //formfield olduğunda onlara da etki ettirecektir.
        onChanged: () {}, //her değişikliği izleyen bir yapı.
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                FormFieldValidator().isNotEmpty(value);
              },
            ),
            DropdownButtonFormField<String>(
                validator: (value) {
                  FormFieldValidator().isNotEmpty(value);
                },
                items: const [
                  DropdownMenuItem(value: 'v1', child: Text('a')),
                  DropdownMenuItem(value: 'v2', child: Text('b')),
                  DropdownMenuItem(value: 'v3', child: Text('c'))
                ],
                onChanged: (value) {}),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    if (kDebugMode) {
                      print('okey');
                    }
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : 'Boş geçilemez';
  }
}
