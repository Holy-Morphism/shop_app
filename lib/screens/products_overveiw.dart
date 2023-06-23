import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';

import '../widgets/products_grid.dart';
import '../providers/cart.dart';
import '../widgets/badge_b.dart';

enum FilterOptions {
  favourites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions value) {
                if (value == FilterOptions.favourites) {
                  setState(() {
                    showFav = true;
                  });
                } else {
                  setState(() {
                    showFav = false;
                  });
                }
              },
              itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: FilterOptions.favourites,
                      child: Text('My Favourites'),
                    ),
                    PopupMenuItem(
                      value: FilterOptions.all,
                      child: Text('Show All'),
                    ),
                  ]),
          Consumer<Cart>(
              builder: (ctx, cart, child) => BadgeB(
                    value: cart.itemCount.toString(),
                    color: Theme.of(context).colorScheme.secondary,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                    ),
                  ))
        ],
        title: const Text('My Shop'),
      ),
      body: ProductGrid(showFav: showFav),
    );
  }
}
