import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:g5/routes/app_routes.dart';

class Acount {
  String? useName;
  String? password;
  Acount({this.useName, this.password});
}

class AccountProvider extends ChangeNotifier {
  var Acount1 = Acount(useName: 'luanhq', password: '@Abc123qwer');

  // String loginHome1({String username = "", String password = ""}) {
  //   EasyLoading.showProgress(1, status: 'loading...');
  //   if (Acount1.useName == username && Acount1.password == password) {
  //     return username;
  //   }
  //   return "";
  // }

  Future<String> loginHome({String username = "", String password = ""}) {
    EasyLoading.show(status: 'loading...');
    return Future.delayed(const Duration(seconds: 5), () {
      EasyLoading.dismiss();
      if (Acount1.useName == username && Acount1.password == password) {
        return username;
      }
      return "";
    });
  }
}
