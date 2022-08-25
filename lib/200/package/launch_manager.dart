import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

mixin LaunchMixin {
  //on Widget sadece classlarda kullanılsın. yani
  final Uri url = Uri.parse('https://flutter.dev');

  //projelerimizin interfacelerini yapıyoruz. Sadece methoda yönelik çalışıyorsak yazarız.
  //yeni bir sınıf üretemeyiz bundan
  //mixini kullanma amacımız işimizi kolaylaştırmak
  Future<void> launchUrl() async {
    // if (!await launchUrl(_url)) {
    //   throw 'Could not launch $_url';
    // }

    //aslında yanlış sayfaya gitme durumu için aşağıdaki gibi kullanılmalı
    if (await canLaunchUrl(url)) {
      await launchUrl();
    }
  }
}
