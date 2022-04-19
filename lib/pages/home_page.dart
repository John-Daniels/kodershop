import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kodershop/core/store.dart';
import 'package:kodershop/models/cart.dart';
import 'package:kodershop/models/catalog.dart';
import 'package:kodershop/utils/routes.dart';
import 'package:kodershop/widgets/home_widgets/catalog_header.dart';
import 'package:kodershop/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

//show message
  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: message.text.make()));
  }

  //get some products online or by cache
  loadData() async {
    var res, parsedData, productsData, noInternet = false;

    var url = 'http://localhost:5000/api/products';
    try {
      res = await http.get(Uri.parse(url));
    } catch (e) {
      noInternet = true;
    }

    if (!noInternet) {
      parsedData = jsonDecode(res.body);
      productsData = parsedData;
    } else {
      final data = await rootBundle.loadString('assets/files/catalog.json');
      parsedData = jsonDecode(data);
      productsData = parsedData['products'];

      showMessage('No internet');
    }

    await Future.delayed(const Duration(seconds: 2));

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: Vx.m12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.primaryColor,
        child: const Icon(CupertinoIcons.cart, color: Colors.white),
      ).badge(
        color: Vx.red500,
        size: 22,
        count: _cart.items.length,
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
