import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:g5/pages/cart_page.dart';
import 'package:g5/pages/product_list_page.dart';
import 'package:g5/provider/loading_provider.dart';
import 'package:getwidget/components/badge/gf_badge.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerLoading = Provider.of<LoadingProvider>(context);

    return Container(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Container(
                height: 50,
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('SHOPEE FAKE'),
                      ],
                    ),
                    Column(
                      children: [
                        GFIconBadge(
                          child: GFIconButton(
                            onPressed: () {
                              Future.delayed(Duration.zero, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CartPage()));
                              });
                              // await providerLoading.loading();
                            },
                            icon: Icon(Icons.add_shopping_cart),
                            size: GFSize.SMALL,
                          ),
                          counterChild: GFBadge(
                            child: Text("0"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: const TabBarView(
              children: [ProductListPage()],
            ),
          )),
    );
  }
}
