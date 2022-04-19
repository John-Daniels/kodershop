import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodershop/core/store.dart';
import 'package:kodershop/models/cart.dart';
import 'package:kodershop/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
          // isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();

          // _cart.catalog = _catalog;
          // _cart.add(catalog);
          // setState(() {});
        }
      },
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.primaryColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
    );
  }
}
