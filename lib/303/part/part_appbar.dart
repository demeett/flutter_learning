part of 'package:flutter_learning/303/part/part_of_learn.dart';
class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return AppBar(
      title: const Text('a'),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.read_more))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}