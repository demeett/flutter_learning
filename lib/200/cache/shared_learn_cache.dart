import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearnView extends StatefulWidget {
  const SharedLearnView({Key? key}) : super(key: key);

  @override
  State<SharedLearnView> createState() => _SharedLearnViewState();
}

class _SharedLearnViewState extends LoadingStateFull<SharedLearnView> {
  int _currentValue = 0;
  @override
  void initState() {
    super.initState();
    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    final prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');
    _onChangeValue(counter.toString());
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_currentValue.toString()), actions: [
          isLoading
              ? const CircularProgressIndicator(
                  color: Colors.red,
                )
              : const SizedBox()
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setInt('counter', _currentValue);
          },
          child: const Icon(Icons.save),
        ),
        body: TextField(
          onChanged: (value) {
            _onChangeValue(value);
          },
        ));
  }
}

//Aşağıda generic type oluşturduk bu sayede sınıftan sonra neyin ismini yazarsak oraya entegre olacak .
abstract class LoadingStateFull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
