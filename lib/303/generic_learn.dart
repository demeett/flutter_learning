class UserManagement<T extends AdminUser> {
  final T admin;
  UserManagement(this.admin);
  void sayName(T user) {}

  int calculateMoney(List<GenericUser> users) {
    int initValue = admin.role == 1 ? admin.money : 0;
    if (users is GenericUser) {
      int sum = 0;
      for (var element in users) {
        sum += element.money;
      }
      return sum;
      int initValue = admin.role == 1 ? admin.money : 0;
    } else if (users is List<AdminUser>) {
      final sumMoney =
          users.map((e) => e.money).fold<int>(initValue, (previousValue, element) => previousValue + element);
      //Yukarıdaki işlemi tek satırda da yapabiliriz.
      final fold2 = users.fold<int>(initValue, (previousValue, element) => previousValue + element.money);
      return sumMoney;
    }
    return 0;
  }

  Iterable<R>? showNames<R>(List<GenericUser> users) {
    //bunu sadece rol:1 olanlar görsün.
    if (R == String) {
      final names = users.map((e) => e.name).cast<R>();
      return names;
    }
    return null;
    //casti kullanabilmem için iterable lazım.
  }
}



class GenericUser {
  final String name;

  final String id;

  final int money;
  GenericUser(this.name, this.id, this.money);
}

class AdminUser extends GenericUser {
  final int role;

  AdminUser(super.name, super.id, super.money, this.role);
}
