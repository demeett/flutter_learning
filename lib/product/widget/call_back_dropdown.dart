import 'package:flutter/material.dart';

import '../../303/part/call_back_learn.dart';

class CallBackDropDown extends StatefulWidget {
  const CallBackDropDown({Key? key, required this.onUserSelected}) : super(key: key);

  final void Function(CallBackUser user) onUserSelected;
  @override
  State<CallBackDropDown> createState() => _CallBackDropDownState();
}

class _CallBackDropDownState extends State<CallBackDropDown> {
  CallBackUser? _user;

  void updateUser(CallBackUser? item) {
    setState(() {
      _user = item;
    });
    if (_user != null) {
      widget.onUserSelected.call(_user!); //Methodun içine git diyor . Aynı zamanda userını gönderiyor.
      //Eğer yukardaki çağırma yapısını yazmazsak diğer sayfadaki onuserselected methodunu es geçecektir.
      // ve belki de bizim o verilerle işlem yapmamız gerekebilir.
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
        value: _user,
        items: CallBackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e.name),
          );
        }).toList(),
        onChanged: updateUser);
  }
}
