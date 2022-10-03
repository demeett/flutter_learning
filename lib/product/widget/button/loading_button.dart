import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key, required this.title, required this.onPressed});
  final String title;
  final Future<void> Function() onPressed;
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;
  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: _isLoading ? const CircularProgressIndicator() : Text(widget.title),
      onPressed: () async {
        _changeLoading();
        await widget.onPressed.call(); // Aslında burası diğer classtaki methodun içini ifade ediyor ve onun içini çağırıyor 
        _changeLoading();
      },
    );
  }
}
