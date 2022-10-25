import 'dart:developer';

import 'package:flutter/cupertino.dart';

class Cart {
  DateTime? currenDate;
  String? id;
  String? title;
  String? image;
  double price;
  int quantity;
  Cart({
    this.currenDate,
    this.id,
    this.title,
    this.image,
    this.price = 0,
    this.quantity = 0,
  });
}

class CartProvider extends ChangeNotifier {
  int quantityCart = 0;

  List<Cart> listcart = [];

  List<Cart> getCart() {
    return listcart;
  }

  DateTime now = new DateTime.now();
  void addToCart(product) {
    print('aaaaaaaaaaaaaaaa');
    print(product.id);
    print(product.title);
    print(product.image);
    print(product.price);
    print(now);

    Cart productc = Cart(
      currenDate: now,
      id: "${product.id}",
      title: product.title,
      image: product.image,
      price: product.price,
      quantity: 1,
    );

    for (int i = 0; i < listcart.length; i++) {
      if (listcart[i].id == productc.id) {
        listcart[i].quantity++;
        return;
      }
    }

    listcart.add(productc);
    quantityCart++;
  }

  void deleteAllCart() {
    listcart.clear();
  }

  void deleteProduct(String id) {
    //   int index = -1;
    //   for (int i = 0; i < listcart.length; i++) {
    //     if (listcart[i].id == id) {
    //       if (listcart[i].quantity > 1) {
    //         listcart[i].quantity--;
    //       } else
    //         index = i;
    //       quantityCart--;
    //     }
    //   }
    //   listcart.removeAt(index);
    // }
  }

  double getTotal() {
    double total = 0;
    for (int i = 0; i < listcart.length; i++) {
      total += listcart[i].quantity.toDouble() * listcart[i].price.toDouble();
    }
    return total;
  }
}
