import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:g5/provider/cart_provider.dart';
import 'package:g5/provider/loading_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var providerLoading = Provider.of<LoadingProvider>(context);
    var providerCart = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'CART',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20, right: 0, bottom: 5, left: 0),
          child: Container(
              margin: EdgeInsets.only(top: 0, right: 0, bottom: 0, left: 40),
              width: MediaQuery.of(context).size.width * .8,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('ORDER'),
                        ],
                      ),
                      Column(
                        children: [Text('EDIT CART')],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Divider(
                              color: Color.fromARGB(255, 0, 0, 0),
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ...providerCart.listcart.map((e) {
                        return Row(children: [
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width * .8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(e.image ?? "",
                                            width: 30,
                                            height: 30,
                                            fit: BoxFit.contain),
                                        Container(
                                          width: 100,
                                          child: Column(
                                            children: [
                                              Text(
                                                '${e.title}',
                                                style: TextStyle(fontSize: 10),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                '${e.currenDate}',
                                                style: TextStyle(fontSize: 10),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.add),
                                                  iconSize: 10,
                                                  onPressed: () {},
                                                ),
                                                Container(
                                                  width: 10,
                                                  child: Text(
                                                    '${e.quantity}',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon:
                                                      const Icon(Icons.remove),
                                                  iconSize: 5,
                                                  onPressed: () {},
                                                ),
                                              ],
                                            )),
                                        Text(
                                          '${e.price}',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ]);
                      }).toList(),
                    ],
                  )
                ],
              )),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 200,
              margin: EdgeInsets.only(top: 0, right: 40, bottom: 0, left: 40),
              width: MediaQuery.of(context).size.width * .8,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Divider(
                            color: Color.fromARGB(255, 0, 0, 0),
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${providerCart.getTotal()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'TOTAL',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${providerCart.getTotal()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 60,
                      margin: EdgeInsets.only(top: 40),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.black),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'PROCEDD TO CHECKOUT',
                            textAlign: TextAlign.center,
                          )),
                    )
                  ],
                ),
              ])),
        ));
  }
}
