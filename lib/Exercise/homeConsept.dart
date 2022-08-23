import 'package:flutter/material.dart';
import 'package:flutter_learning/101/image_learn.dart';
import 'package:flutter_learning/Exercise/homeCard.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

class HomeConsept extends StatefulWidget {
  const HomeConsept({Key? key}) : super(key: key);

  @override
  State<HomeConsept> createState() => _HomeConseptState();
}

class _HomeConseptState extends State<HomeConsept> {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: textMethod(context),
        ),
        drawer: Drawer(
            width: 200,
            backgroundColor: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.5)),
                  child: Text(
                    'Menü',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.black87),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.message_rounded,
                    color: Colors.black87,
                  ),
                  title:
                      Text('Message', style: TextStyle(color: Colors.black87)),
                ),
                ListTile(
                    leading: const Icon(
                      Icons.settings_applications_rounded,
                      color: Colors.black87,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: const Text('Settings',
                        style: TextStyle(color: Colors.black87)))
              ],
            )),
        body: FullScreenWidget(
          child: Container(
              width: _width,
              height: _height,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  const Expanded(
                    child: SizedBox(
                      child: ProjectClipRRect(),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: edgeInsetsMethod(),
                        child:
                            ProjectElevatedButton().elevatedFunction(context),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }

  Text textMethod(BuildContext context) {
    return Text(
      TextProject().title,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(color: Colors.blueGrey[50]),
      textAlign: TextAlign.start,
    );
  }

  EdgeInsets edgeInsetsMethod() {
    return const EdgeInsets.only(left: Sizing.left, bottom: Sizing.bottom);
  }
}

class ProjectClipRRect extends StatelessWidget {
  const ProjectClipRRect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        "assets/png/living-10-1.jpg",
        fit: BoxFit.fitHeight,
        alignment: Alignment.center,
      ),
    );
  }
}

class TextProject {
  final String title = 'Home Decoration';
  static const show = 'Show';
}

class Sizing {
  static const double left = 120;
  static const double bottom = 30;
  static const double horizontal = 30;
}

class ProjectElevatedButton {
  ElevatedButton elevatedFunction(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const HomeCard();
        }));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.white.withOpacity(0.7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onPrimary: Colors.brown),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizing.horizontal),
        child: Text(TextProject.show),
      ),
    );
  }
}
