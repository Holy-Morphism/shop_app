import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.dart';

import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const String routeName = '/orders-screen';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, i) {
            return OrderItem(order: orders.orders[i]);
          },
          itemCount: orders.orders.length),
    );
  }
}
