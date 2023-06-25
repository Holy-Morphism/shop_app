import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalOfItems}',
                    style: TextStyle(
                      color:
                          Theme.of(context).primaryTextTheme.titleLarge?.color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.cartItems.values.toList(), cart.totalOfItems);
                      cart.clear();
                    },
                    child: const Text('Order Now')),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return ci.CartItem(
                  id: cart.cartItems.values.toList()[i].id,
                  productId: cart.cartItems.keys.toList()[i],
                  price: cart.cartItems.values.toList()[i].price,
                  quantity: cart.cartItems.values.toList()[i].quantity,
                  title: cart.cartItems.values.toList()[i].title);
            },
            itemCount: cart.itemCount,
          ),
        )
      ]),
    );
  }
}
