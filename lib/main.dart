import 'package:flutter/material.dart';
import 'package:kodershop/core/store.dart';
import 'package:kodershop/pages/cart_page.dart';
import "package:kodershop/pages/home_page.dart";
import 'package:kodershop/pages/login_page.dart';
import 'package:kodershop/utils/routes.dart';
import 'package:kodershop/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

//TODO: implement splash screen bro (its important (*_*))

main() {
  runApp(
    VxState(
      store: MyStore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        '/': (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
