import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingProvider extends ChangeNotifier {
  Future<void> loading() {
    EasyLoading.show(status: 'loading...');
    return Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });
  }
}
