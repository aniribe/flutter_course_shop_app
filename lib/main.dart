import 'package:flutter/material.dart';
import 'package:flutter_course_shop_app/models/product.dart';
import 'package:flutter_course_shop_app/providers/products_provider.dart';
import 'package:flutter_course_shop_app/screens/product_details_screen.dart';
import 'package:flutter_course_shop_app/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen()
        },
      ),
    );
  }
}
