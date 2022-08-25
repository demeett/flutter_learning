import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  //projelerimizin interfacelerini yapıyoruz. Sadece methoda yönelik çalışıyorsak yazarız.
  //yeni bir sınıf üretemeyiz bundan
  //mixini kullanma amacımız işimizi kolaylaştırmak
  Future<void> stringUrlLaunch(String value) async {
    // if (!await launchUrl(_url)) {
    //   throw 'Could not launch $_url';
    // }

    final uri = Uri.parse(value);

    //aslında yanlış sayfaya gitme durumu için aşağıdaki gibi kullanılmalı
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
