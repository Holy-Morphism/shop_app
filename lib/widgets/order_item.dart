import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as oi;

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final oi.OrderItem order;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '\$${order.amount}',
            ),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
                onPressed: () => Void, icon: const Icon(Icons.expand_more)),
          ),
        ],
      ),
    );
  }
}
