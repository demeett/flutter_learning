import 'package:flutter/material.dart';
import 'shared_learn_cache.dart';
import 'package:flutter_learning/200/cache/shared_manager.dart';
import 'package:flutter_learning/200/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_learning/200/cache/user_cache/user_model.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStateFull<SharedListCache> {
  late final UserCacheManager _userCacheManager;
   List<User> useritems=[];
  late final SharedManager _sharedManager;
  @override
  void initState() {
    super.initState();
    _sharedManager = SharedManager();
    initialSharedManager();
  }

  Future<void> initialSharedManager() async {
    print('hello');
    await _sharedManager.init(); // bu satır bitmeden methodun içindeki diğer satırları çağırma beni bekle demek ...
    _userCacheManager = UserCacheManager(_sharedManager);
    setState(() {
          print('hellostst');

          useritems=UserCacheManager(_sharedManager).getItems()??[];

    });
  }

  @override
  Widget build(BuildContext context) {
        print('hellobuild');

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              isLoading ? CircularProgressIndicator(color: Colors.amber) : null,
          actions: isLoading? null:[
            IconButton(
                onPressed: (() async {
                  changeLoading();
                  await UserCacheManager(_sharedManager).saveItems(useritems);
                  changeLoading();
                }),
                icon: Icon(Icons.download_for_offline_outlined, color: Colors.red,)),
            IconButton(
                onPressed: (() {}), icon: Icon(Icons.remove_circle_outline))
          ],
        ),
        body: Column(
          children: [Expanded(child: listviewMethod())],
        ));
  }

  ListView listviewMethod() {
    return ListView.builder(
      itemCount: useritems.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(useritems[index].name ?? ''),
            subtitle: Text(useritems[index].email ?? ''),
            trailing: Text(useritems[index].url ?? '',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    decoration: TextDecoration.underline, color: Colors.blue)),
          ),
        );
      },
    );
  }
}
