import 'package:flutter/material.dart';
import 'package:kodershop/models/catalog.dart';
import 'package:kodershop/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            '\$${catalog.price}'.text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 50),
          ],
        ).p32(),
      ),
      body: Column(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.asset(
              'assets/images/${catalog.image}',
              fit: BoxFit.fill,
            ).p16().h32(context),
          ).p16(),
          Expanded(
            child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(context.theme.primaryColorDark)
                        .bold
                        .make(),
                    catalog.desc.text.xl
                        .textStyle(const TextStyle(fontSize: 10))
                        .make(),
                    10.heightBox,
                    "These are more descriptions about this products"
                        .text
                        .make()
                        .py16(),
                  ],
                ).py64(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
