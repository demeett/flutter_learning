import 'package:flutter/material.dart';

//SİZEDBOX: Bir iskelet kutu oluşturur .
//Container ve sizedbox farklarından biri color özellğidir. Containerda color vardır sizedboxta yoktur.
class ContainerSizedBoxLearn extends StatelessWidget {
  const ContainerSizedBoxLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            //width, height değerleri pixeli ifade eder.
            width: 200,
            height: 200,
            child: Text('a' * 500),
          ),
          const SizedBox.shrink(), //Boş bir alan tanımlamak için kullanırız.
          SizedBox.square(
            dimension: 50, //dimension boyutu 50 olan kare bi alan oluşturuyor.
            child: Text('a' * 50),
          ), //kare bir alan tanımlamış oluruz.

          Container(
            height: 50,

            constraints: const BoxConstraints(
                maxWidth: 150,
                minWidth: 20,
                maxHeight: 100), //responsive yapıda önemli olabilir bu kullanım
            child: Text('aa' * 1),
            padding:
                const EdgeInsets.all(10), //her yerden 10 luk iç boşluk atar.
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility
                .boxdeco, //veya ProjectContainerDecoration() olarak kullanırız.
          )
        ],
      ),
    );
  }
}

//BoxDecoration'da birinci kullanım :
class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            gradient: const LinearGradient(colors: [
              Colors.red,
              Colors.black
            ]), //kutu içini yarı kırmızı yarı siyah yapar.
            boxShadow: const [
              BoxShadow(
                  color: Colors.green,
                  offset: Offset(0.1,
                      1), //offset x ve y ekseninde gölge miktarını belirler.
                  blurRadius:
                      10) //dışına ne kadarlık gölge verileceğini belirler.
            ],
            borderRadius:
                BorderRadius.circular(10), // kutunun dışını yumuşatır.
            color: Colors.red, //color kullanıyorsak decoration içinde verilmeli
            //shape: BoxShape.circle,// şekli yuvark hale getiriyor.
            border: Border.all(width: 1, color: Colors.white));
}
//BoxDecoration'da ikinci kullanım :

class ProjectUtility {
  static final BoxDecoration boxdeco = BoxDecoration(
      gradient: const LinearGradient(colors: [
        Colors.red,
        Colors.black
      ]), //kutu içini yarı kırmızı yarı siyah yapar.
      boxShadow: const [
        BoxShadow(
            color: Colors.green,
            offset: Offset(
                0.1, 1), //offset x ve y ekseninde gölge miktarını belirler.
            blurRadius: 10) //dışına ne kadarlık gölge verileceğini belirler.
      ],
      borderRadius: BorderRadius.circular(10), // kutunun dışını yumuşatır.
      color: Colors.red, //color kullanıyorsak decoration içinde verilmeli
      //shape: BoxShape.circle,// şekli yuvark hale getiriyor.
      border: Border.all(width: 1, color: Colors.white));
}
