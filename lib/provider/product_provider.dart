import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g5/model/product_modal.dart';
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  List<ProductModal> list = [];
  //get data
  void getProducts() async {
    //get data from web
    var url = 'https://fakestoreapi.com/products';
    var client = http.Client();
    var rs = await client.get(Uri.parse(url));
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString) as List;

    list = jsonObject.map((e) {
      return ProductModal.fromJson(e);
    }).toList();

    notifyListeners();
  }

  //add data
  void addProduct(dataProduct) async {}

  //remove data
  void removeDate(idProduct) async {
    assert(idProduct == null);
    list.every((product) => product.id == idProduct);
  }

  //edit data
  void editData() async {}
}
