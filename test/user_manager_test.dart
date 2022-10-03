import 'package:flutter_learning/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test('User Calculate Test', () {
    final users = [
      GenericUser('name', '44', 50),
      GenericUser('dm', '66', 90),
      GenericUser('dmdd', '56', 70),
    ];
    final adminUser = [
      AdminUser('dd', '23', 55, 1),
      AdminUser('hd', '44', 44, 4),
    ];
    final result = UserManagement(AdminUser('name', 'id', 10, 1)).calculateMoney(users);
    final resultadmin = UserManagement(AdminUser('name', 'id', 10, 1)).calculateMoney(adminUser);
    final names = UserManagement(AdminUser('', 'ddd', 33, 1)).showNames<String>(users);
    expect(result, 99); // burası kontrol mekanizması değerleri eşitse yukarıda tik olacak.
  });
}
