import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:g5/pages/cart_page.dart';
import 'package:g5/pages/signin_page.dart';
import 'package:g5/provider/cart_provider.dart';
import 'package:g5/provider/loading_provider.dart';
import 'package:g5/provider/product_provider.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    var providerLoading = Provider.of<LoadingProvider>(context);
    var providerCart = Provider.of<CartProvider>(context);
    provider.getProducts();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          ...provider.list.map((e) {
            return Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Image.network(e.image ?? "",
                        width: 100, height: 80, fit: BoxFit.contain),
                  ),
                  Flexible(
                      child: Text(
                    e.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                        color: Colors.black),
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'price: ${e.price}',
                              style: TextStyle(fontSize: 10),
                            ),
                            GFRating(
                              size: 10,
                              color: Color.fromRGBO(255, 173, 39, 1),
                              value: 3,
                              onChanged: (double rating) {},
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                width: 40,
                                height: 20,
                                child: (ElevatedButton(
                                  child: Icon(
                                    Icons.add_sharp,
                                    size: 10,
                                  ),
                                  onPressed: () async {
                                    await providerLoading.loading();
                                    providerCart.addToCart(e);
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CartPage()));
                                  },
                                ))),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
