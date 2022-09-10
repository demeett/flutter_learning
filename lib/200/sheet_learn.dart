import 'dart:developer';

import 'package:flutter/material.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> {
  Color _backgroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              backgroundColor: Colors.greenAccent, // Burası açılan sayfanın rengi
              barrierColor: Colors.transparent, // açılan modal ile birlikte asıl sayfadaki rengi değiştiriyor
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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
