import 'package:flutter/material.dart';
import '../products/product_manager.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProducts;
  final Function deleteProducts;

  HomePage(this.products, this.addProducts, this.deleteProducts);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text("Choose"),
            ),
            ListTile(
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text("Manage Products"),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/admin");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("EasyList"),
        centerTitle: true,
      ),
      body: ProductManager(products, addProducts,
          deleteProducts), //startingProduct: 'Food tester',
    );
  }
}
