import 'dart:developer';

import 'package:flutter/material.dart';
import '../101/image_learn.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheet {
  bool? result;
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          result = await showModalBottomSheet(
              //backgroundColor: Colors.greenAccent, // Burası açılan sayfanın rengi
              //barrierColor: Colors.transparent, // açılan modal ile birlikte asıl sayfadaki rengi değiştiriyor
              //Rengi transparent verirsek eğer appbardaki nesneleri ezmez gösterir.
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
              context: context,
              isScrollControlled: true, // Ekranın full açılmasını sağlar
              builder: (context) {
                return _CustomSheet(
                  backgroundColor: _backgroundColor,
                );
              });
          inspect(result);
          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.pinkAccent;
            });
          } else {
            setState(() {
              _backgroundColor = Colors.black;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
      body: TextButton(
          onPressed: () {
            customProductSheet(context, const ImageViewLearn());
          },
          child: const Text('Sayfayı Aç')),
    );
  }

//istersek container ile bu yapıyı kurabiliriz fakat column attığımızda zaten yapıyı genişletiyor
  Container containermethod(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({Key? key, required Color backgroundColor}) : super(key: key);

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  Color _backgroundColor = Colors.white;
  final double _gripHeight = 30;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _BaseSheetHeader(gripHeight: _gripHeight),
            const Text('Welcome to london'),
            Image.network(
              'https://picsum.photos/seed/picsum/200/300',
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop<bool>(true); // Açılan showmodalbottonsheeti kapatır
                  //burada true diğer sayfaya haber vermek içn kullanılan bir değerdir . Butona basınca true yapmış olduk.
                  //BottomSheetimden beni çağıranları haber verebiliyorum elle kapatırsa yukardaki result true dönmez
                  //navigator olmazsa result sonuç dönmez buraya basıldığında .
                  //pop un içerisine istediğimiz türde bir değer dönebiliyoruz
                  setState(() {
                    _backgroundColor = Colors.purple;
                  });
                },
                child: const Icon(Icons.one_k))
          ],
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader({
    Key? key,
    required double gripHeight,
  })  : _gripHeight = gripHeight,
        super(key: key);

  final double _gripHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gripHeight,
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
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: Icon(Icons.close),
                )),
          )
        ],
      ),
    );
  }
}

mixin ProductSheet {
  Future<T?> customProductSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet(
        //backgroundColor: Colors.greenAccent, // Burası açılan sayfanın rengi
        //barrierColor: Colors.transparent, // açılan modal ile birlikte asıl sayfadaki rengi değiştiriyor
        //Rengi transparent verirsek eğer appbardaki nesneleri ezmez gösterir.
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        context: context,
        isScrollControlled: true, // Ekranın full açılmasını sağlar
        builder: (context) {
          return _CustomMainSheet(child: child);
        });
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({required this.child});
  final Widget child;
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _BaseSheetHeader(
            gripHeight: 30,
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
