import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$image',
      fit: BoxFit.fitHeight,
    )
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .wPCT(context: context, widthPCT: context.isMobile ? 40 : 25);
  }
}





// return Scaffold(
//   appBar: AppBar(
//       title: const Text(
//     '#Koder Shop',
//     style: TextStyle(color: Colors.black),
//   )),
//   body: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: (CatalogModel.items.isNotEmpty)
//         ? ListView.builder(
//             itemCount: CatalogModel.items.length,
//             itemBuilder: (context, index) {
//               return ItemWidget(
//                 item: CatalogModel.items[index],
//               );
//             },
//           )
//         : const Center(child: CircularProgressIndicator()),
//   ),
//   drawer: const MyDrawer(),
// );

// GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16,
//                 ),
//                 itemBuilder: (context, index) {
//                   var image = CatalogModel.items[index].image;
//                   var name = CatalogModel.items[index].name;
//                   var desc = CatalogModel.items[index].desc;
//                   var price = CatalogModel.items[index].price;

//                   return Card(
//                     clipBehavior: Clip.antiAlias,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: GridTile(
//                       header: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: const BoxDecoration(
//                           color: Colors.deepPurple,
//                         ),
//                         child: Text(
//                           '$name',
//                           textScaleFactor: 1.2,
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                       child: Image.asset(
//                         'assets/images/$image',
//                       ),
//                       footer: Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: const BoxDecoration(
//                           color: Colors.deepPurple,
//                         ),
//                         child: Text(
//                           '\$$price',
//                           textScaleFactor: 1.2,
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: CatalogModel.items.length,
//               )

//  Container(
//           alignment: Alignment.center,
//           child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: const [
//             CircularProgressIndicator(),
//             Text("welcome to #john_koder's shop", style: TextStyle(fontSize: 20)),
//           ],
//         ))
