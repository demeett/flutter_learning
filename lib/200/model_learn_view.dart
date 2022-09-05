import 'package:flutter/material.dart';
import 'package:flutter_learning/200/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  late PostModel2 user9; //burası final olursa hiç değiştiremeyiz aşağıda
  @override
  void initState() {
    super.initState();
    final user1 = PostModels2(userId: 1, id: 1, title: 'DD', body: 'demet ');
    final user2 = PostModel2()
      ..id = 1
      ..userId = 1
      ..body = ".."
      ..title = "f";
    final user3 = PostModels()
      ..userId = 1
      ..id = 1
      ..title = "Başlık"
      ..body = "hello";
    final user4 = PostModel3(1, 2, "", "");
    final user5 = PostModel4(userId: 1, id: 2, title: "title", body: "body");
    final user6 = PostModel5(userId: 1, id: 2, title: "title", body: " body");
    final user7 = PostModel6();
    final user8 = PostModels2(userId: 1, id: 2, title: "title", body: "body");
    user9 = PostModel2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(user9.title ?? 'değişken')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              //user9=user9.
            });
          },
        ));
  }
}
