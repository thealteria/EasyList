import 'package:easylist/pages/home.dart';
import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/products_admin.dart';
import './pages/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = [];

  void _addProducts(Map<String, String> product) {
    setState(() {
      _products.add(product);
      // Toast.show("$product added", context);
    });
  }

  void _deleteProducts(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "EasyList",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, accentColor: Colors.deepPurple),
      // home: new HomePage(),
      routes: {
        "/": (context) => HomePage(_products, _addProducts, _deleteProducts),
        /* "/" => reserved name for home page, just like "home: " argument and both 
        won't work together */
        "/admin": (context) => ProductsAdmin(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split("/");
        if (pathElements[0] != "") {
          return null;
        }
        if (pathElements[1] == "product") {
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (context) => ProductPage(
                  _products[index]['title'],
                  _products[index]['image'],
                ),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) =>
              HomePage(_products, _addProducts, _deleteProducts),
        );
      },
    );
  }
}
