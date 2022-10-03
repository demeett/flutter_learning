import 'package:flutter/material.dart';
import 'package:flutter_learning/101/image_learn.dart';

class SheetExercise extends StatefulWidget {
  const SheetExercise({super.key});

  @override
  State<SheetExercise> createState() => _SheetExerciseState();
}

class _SheetExerciseState extends State<SheetExercise> with _ShowButtomSheet {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showButtomMethod(context, const Expanded(child: CustomWidget(widget: Expanded(child: ImageViewLearn()))));
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

mixin _ShowButtomSheet {
  Future<T?> showButtomMethod<T>(context, Widget widget) async {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) {
          return CustomWidget(widget: widget);
        });
  }
}

// NEden statefull oldupunda burası çalışmadı?
class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(0.08),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Divider(
                    color: Colors.greenAccent,
                    thickness: 3, //kalınlık demek ,
                    indent: MediaQuery.of(context).size.width *
                        0.45, // indent ve endindent soldan sağdan verilen boşluğu ifade eder
                    endIndent: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Positioned(
                    right: 10,
                    top: 5,
                    child: widget,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
