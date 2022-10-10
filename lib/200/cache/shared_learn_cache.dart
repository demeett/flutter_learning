import 'package:flutter/material.dart';
import 'shared_manager.dart';
import 'user_cache/user_model.dart';

class SharedLearnView extends StatefulWidget {
  const SharedLearnView({Key? key}) : super(key: key);

  @override
  State<SharedLearnView> createState() => _SharedLearnViewState();
}

class _SharedLearnViewState extends LoadingStateFull<SharedLearnView> {
  int _currentValue = 0;
  late final SharedManager manager;
  late final List<User> useritems;
  @override
  void initState() {
    super.initState();
    manager = SharedManager();
    _initialize();
    useritems = ListUser().listuser;
  }

  Future<void> _initialize() async {
    changeLoading();

    await manager.init();
    getDefaultValues();
    changeLoading();
  }

  Future<void> getDefaultValues() async {
    final val = manager.getString(SharedKeys.counter) ?? '';
    _onChangeValue(val);
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
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SaveActionButton(currentValue: _currentValue, manager: manager),
            RemoveActionButton(manager: manager),
          ],
        ),
        body: Column(
          children: [
            TextField(
              onChanged: (value) {
                _onChangeValue(value);
              },
            ),
            Expanded(child: listviewMethod())
          ],
        ));
  }

  ListView listviewMethod() {
    return ListView.builder(
      itemCount: useritems.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(useritems[index].name??''),
            subtitle: Text(useritems[index].email??''),
            trailing: Text(useritems[index].url??'',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(decoration: TextDecoration.underline, color: Colors.blue)),
          ),
        );
      },
    );
  }
}



class ListUser {
  List<User> listuser = [
    User(name:'name',  email: 'email',  url:'url'),
    User(name:'name1', email: 'email1', url:'url1'),
    User(name:'name3', email: 'email3', url:'url3'),
    User(name:'name4', email: 'email4', url:'url4')
  ];
}

class SaveActionButton extends StatelessWidget {
  const SaveActionButton(
      {super.key, required int currentValue, required this.manager})
      : _currentValue = currentValue;

  final int _currentValue;
  final SharedManager manager;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await manager.saveString(SharedKeys.counter, _currentValue.toString());
      },
      child: const Icon(Icons.save),
    );
  }
}

class RemoveActionButton extends StatelessWidget {
  const RemoveActionButton({
    required this.manager,
    super.key,
  });
  final SharedManager manager;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await manager.removeItem(SharedKeys.counter);
      },
      child: const Icon(Icons.remove),
    );
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
