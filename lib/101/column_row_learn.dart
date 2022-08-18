import 'package:flutter/material.dart';

import 'card_learn.dart';

class ColumnRowView extends StatelessWidget {
  const ColumnRowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExpandedWithRow(
              colors: ColorUtility().purpleshade,
              flexSize: 4,
            ),
            ExpandedWithRow(
              colors: ColorUtility().greenshade,
              flexSize: 2,
            ),
            ExpandedWithRow(
              colors: ColorUtility().purpleshade,
              flexSize: 2,
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Eşit boşluk bırakarak sığdırma satıra
                crossAxisAlignment: CrossAxisAlignment
                    .end, //varolan alanda üste ya da en alta konumlandırma.
                children: [Text('Helloo'), Text('selam'), Text('merhaba')],
              ),
            )
          ],
        ));
  }
}

class ExpandedWithRow extends StatelessWidget {
  const ExpandedWithRow(
      {Key? key, required this.colors, required this.flexSize})
      : super(key: key);
  final Color colors;
  final int flexSize;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexSize,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Card(
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ProjectCard(
                colorName: colors,
                sizeBox: SizedBox(width: 50, height: 50),
                shapes: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))
          ]),
        ),
      ),
    );
  }
}

class ColorUtility {
  final Color purpleshade = Colors.purple.shade400;
  final Color greenshade = Colors.green.shade400;
}
