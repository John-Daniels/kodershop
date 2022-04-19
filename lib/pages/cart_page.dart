import 'package:flutter/material.dart';
import 'package:kodershop/core/store.dart';
import 'package:kodershop/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.canvasColor,
          title: "Cart".text.make(),
        ),
        body: Column(
          children: [
            _CartList().p32().expand(),
            const Divider(),
            const _CartTotal(),
          ],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _cart = CartModel();
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
        height: 200,
        child: Row(
          children: [
            "\$${_cart.totalPrice}"
                .text
                .xl5
                .color(context.theme.primaryColorDark)
                .make(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                //show message
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: "Buying not supported yet".text.make()));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.primaryColor)),
              child: "Buy".text.white.make(),
            ).w32(context),
          ],
        ).p12() //removelater,
        );
  }
}

class _CartList extends StatelessWidget {
  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing to show here(0_0)(-_-)(*_*)".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
