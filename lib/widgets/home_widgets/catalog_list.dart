import 'package:flutter/material.dart';
import 'package:kodershop/models/catalog.dart';
import 'package:kodershop/widgets/home_widgets/add_to_cart.dart';
import 'package:kodershop/widgets/home_widgets/catalog_image.dart';
import 'package:kodershop/pages/home_detail_page.dart';
import 'package:kodershop/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (!context.isMobile)
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: 0.2,
              crossAxisSpacing: 10,
            ),
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];

              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailPage(catalog: catalog),
                        ),
                      ),
                  child: CatalogItem(catalog: catalog));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];

              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailPage(catalog: catalog),
                        ),
                      ),
                  child: CatalogItem(catalog: catalog));
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: catalog.image,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(const TextStyle(fontSize: 10)).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                '\$${catalog.price}'.text.bold.xl.make(),
                AddToCart(catalog: catalog),
              ],
            ).pOnly(right: 8),
          ],
        ).p(context.isMobile ? 0 : 16),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(children: children2)
          : Column(children: children2).wOneForth(context),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
