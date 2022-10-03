import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await showDialog(
              // bu bir alert butonudur
              barrierDismissible: false, // showdialog açıldığında ana ekrandan hiç bir yere basılmamasını sağlar
              context: context,
              builder: (context) {
                return const ImageDialog();
              });
          inspect(response);
        },
      ),
    );
  }
}

class _AlertDialog extends StatelessWidget {
  const _AlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('version update!'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('update')),
        TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('Close'))
      ],
    );
  }
}

class _UpdateDialog extends AlertDialog {
  _UpdateDialog({Key? key, required BuildContext context})
      : super(
          //super kısmını tekrardan sor
          key: key,
          title: const Text('version update!'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('update')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Close'))
          ],
        );
}

class ImageDialog extends StatelessWidget {
  const ImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        height: 400,
        child: InteractiveViewer(
          child: Image.network(
            'https://picsum.photos/200',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
