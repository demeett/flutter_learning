import 'package:flutter_learning/303/generic_learn.dart';
import 'package:flutter_learning/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test("List best of", () {
    List<GenericUser> users = [
      GenericUser('name', '44', 50),
      GenericUser('dm', '66', 90),
      GenericUser('dmdd', '56', 70),
    ];
    List<HighCard> highCards = users.map((e) {
      return HighCard(items: e.name.split('').toList());
    }).toList();
    users.singleWhere((element) => element.name == 'dm');
  });

  test("List best of", () {
    List<GenericUser> users = [
      GenericUser('name', '44', 50),
      GenericUser('dm', '66', 90),
      GenericUser('dmdd', '56', 70),
    ];
    users.where((element) => element.money > 70);
  });
}
