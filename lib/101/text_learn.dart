import 'package:flutter/material.dart';

class TextLearn extends StatelessWidget {
  final String title = 'By the best one';
  final String name =
      'Demet'; //bunu text içerisine injekte etmek istiyoruz. $name yazarız.
  //Stringlerle oynama yapabilirz mesele lenght istiyorsak {$name.lenght} yazarız .
  final String? value = '';

  const TextLearn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, //Burada yazıyı centera çekmeye yarıyor .
            children: [
              Text(
                title * 10,
                maxLines: 2,
                overflow: TextOverflow
                    .ellipsis, //burada metin sığmıyorsa 3 nokta ile devam ettirir.
                style: ProjectStyles.textStyle,
              ),
              Text(
                title * 10,
                maxLines: 2,
                overflow: TextOverflow
                    .ellipsis, //burada metin sığmıyorsa 3 nokta ile devam ettirir.
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: ProjectColors
                        .welcomeColor), //Burada bütün ?. yazıp copywith yazarsak
                //bütün özellikleri kopyalıyoruz sadece değiştmrke istediğimiz özellik hariç.
              ),
              Text(value ?? '') // Value boş  gelirse bu şekilde yollayabiliriz.
            ]),
      ),
    );
  }
}

//Projelerde textStyle kullanımı theme.of şeklinde yapılınca daha doğru bir kullanım sağlar.
//!!! Text içerisine null gelebilme ihtimali olan veriler girilmez . Controlünü yaparsın.
class ProjectStyles {
  static TextStyle textStyle = const TextStyle(
      wordSpacing: 2,
      letterSpacing: 3,
      fontSize: 24,
      color: Colors.lime,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline);
}

class ProjectColors {
  static const Color welcomeColor = Colors
      .red; // proje hot reloaddayken bu rengi kırmızı yaptırmaz . Çünkü değişikliği algılamaz.
  //Ama get li kullansaydık direk son değiişikliği alırdı.
  //Burayı yeniden başlatınca kırmızı olur rengi
}
