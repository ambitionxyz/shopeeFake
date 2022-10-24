import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:g5/pages/cart_page.dart';
import 'package:g5/pages/home_page.dart';
import 'package:g5/pages/productDetail_page.dart';
import 'package:g5/pages/signin_page.dart';
import 'package:g5/provider/accout_provider.dart';
import 'package:g5/provider/product_provider.dart';

//file
import 'package:g5/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((_) => ProductProvider())),
      ChangeNotifierProvider(create: ((_) => AccountProvider()))
    ],
    child: MaterialApp(
      initialRoute: Routes.screenLogin,
      builder: EasyLoading.init(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.screenLogin:
            return MaterialPageRoute(builder: (_) => LoginPapge());
            break;
          case Routes.screenHome:
            return MaterialPageRoute(builder: (_) => HomePage());
            break;
          case Routes.screenCart:
            return MaterialPageRoute(builder: (_) => CartPage());
            break;
          case Routes.screenProductDetail:
            return MaterialPageRoute(builder: (_) => ProductDetailPage());
            break;
        }
      },
    ),
  ));
}
