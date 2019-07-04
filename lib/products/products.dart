import 'package:flutter/material.dart';
import '../pages/product_page.dart';

class Product extends StatelessWidget {
  //immutable means not changable
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Product(this.products, {this.deleteProduct}) {
    /**
     for named arguments, {argument}, we wrap the argument with {}
     for postional argmunets, use []
     */
    print('[Products widget] constructor');
  }

  Widget _buildProductItem(_, int index) {
    return Card(
        child: GestureDetector(
      onTap: () => Navigator.push<bool>(
            _,
            MaterialPageRoute(
              builder: (_) => ProductPage(
                    products[index]['title'],
                    products[index]['image'],
                  ),
            ),
          ).then((bool value) {
            if (value) {
              deleteProduct(index);
            }
            print(value);
          }),
      child: Column(
        children: <Widget>[
          Image.asset(
            products[index]['image'],
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              products[index]['title'],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Container(
        child: Center(
          child: Text("No products found, please add some products"),
        ),
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products widget] build');
    return _buildProductList();
  }
}

/**
 * ListView(
      children: products
          .map(
            /*map method allows us to transform every element in 
                the list into a new element and return it*/
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/food.jpg"),
                      Text(element),
                    ],
                  ),
                ),
          )
          .toList(),
    )
 */
