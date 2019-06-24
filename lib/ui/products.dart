import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  //immutable means not changable
  final List<String> products;

  Product([this.products = const []]) {
    /**
     for named arguments, {argument}, we wrap the argument with {}
     for postional argmunets, use []
     */
    print('[Products widget] constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/food.jpg"),
          Text(products[index]),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      Center(
        child: Text("No products found, please add some products"),
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
