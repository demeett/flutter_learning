import 'package:flutter/material.dart';

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({Key? key}) : super(key: key);

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  bool isVisible = true;
  bool _isOpacity = true;
  void changeLoading() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: placeholderWidget(isVisible: isVisible)),
        floatingActionButton: FloatingActionButton(onPressed: () {
          changeLoading();
          controller.animateTo(isVisible ? 1 : 0);
        }),
        body: Column(
          children: [
            animatedOpacityMethod(),
            const AnimatedDefaultTextStyle(
                style: TextStyle(),
                duration: Duration(seconds: 1),
                child: Text('a')),
            AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
            AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: isVisible ? 0 : MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.height * 0.2,
                color: Colors.red),
            Expanded(
                child: Stack(
              children: const [
                AnimatedPositioned(
                    top: 10,
                    curve: Curves.elasticOut,
                    duration: Duration(
                        seconds:
                            1), //burası animasyon gibi yukarıı çıkıp aşağı iniyor.
                    child: Text('data'))
              ],
            ))
          ],
        ));
  }

  ListTile animatedOpacityMethod() {
    return ListTile(
      title: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: _isOpacity ? 1 : 0,
          child: const Text('data')),
      trailing: IconButton(
        onPressed: () {
          _changeOpacity();
        },
        icon: const Icon(Icons.abc_outlined),
      ),
    );
  }
}

class placeholderWidget extends StatelessWidget {
  const placeholderWidget({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      crossFadeState:
          isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(seconds: 1),
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}


//Text('data', style: context.textTheme().subtitle1) extensionı böyle kullanabilirim.