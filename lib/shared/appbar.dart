
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/checkout.dart';
import '../provider/cart.dart';

class ProductsAndPrice extends StatelessWidget {
  const ProductsAndPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);
    return Row(
      children: [
        Stack(
          children: [
            Positioned(
              bottom: 24,
              child: Container(
                  padding:const EdgeInsets.all(5),
                  decoration:const BoxDecoration(
                      color: Color.fromARGB(168, 152, 118, 83),
                      shape: BoxShape.circle),
                  child: Text(
                    "${carttt.itemCount}",
                    style:const TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                  )),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const CheckOut(),
                  ),
                );
              },
              icon:const Icon(Icons.favorite),
            ),
          ],
        ),

      ],
    );
  }
}