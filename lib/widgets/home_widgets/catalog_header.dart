import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Koder Shop".text.xl5.bold.color(context.theme.primaryColorDark).make(),
        'Trending products'.text.xl2.make()
      ],
    );
  }
}
