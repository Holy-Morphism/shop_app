import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            title: const Text('Shop'),
            leading: const Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: const Text('Orders'),
            leading: const Icon(Icons.payment),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
