import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';
import 'package:toast/toast.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct}) {
    /**
     * Constructor(argument) => positional argument
     * {argument} => named argument. Also this makes it an optional argument
     * ex: textColor: Colors.white
     */
    print('[ProductManager widget] constructor');
  }

  /*
   * "_name" => class or var only use i =n that file and don't want anyone to import the class or directly
   *            access the methods or properties on this class. 
   *            If you don't want to directly access to these methods
   */

  @override
  State<StatefulWidget> createState() {
    print('[ProductManager widget] createState');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];
  /*
   * final => can't give a new value to the var but add or update the var
   ex: final int age = 4;

        age = 5; => this will give erro bcoz we are assigning a new value to the age var
        
        * In the case of list, _products = [..values..], gives error bcoz we are assigning it to a new list by using
        the equals sign. 
        * But in the case of "_products.add(values)", we are just updating or adding the new values to the existing
        list, hence by defining "_products" as final it still works. Changing the existing value is possible
        bcoz lists and objects are reference types, means we only the store the reference to an object in 
        "_products", the reference to the array and then if we call an object, this is fine.
        * This changes the existing element but doesn't create and assign a new one and that's the only thing that 
        final prevents.

        * Hence by assigning "final" to "List<String> _products" it won't give any error.

        Note: final disallows to use "=" more than once.

        **************************************************************************************************

        * const => use when you want that the value will never to be changed. Use after the "=" sign
        * final => use when you just want to be sure that you'll never be able to assign a new value to a
                   property.
   */

  @override
  void initState() {
    //execute when the state is created | initeState runs before build runs
    super.initState();

    if (widget.startingProduct != null) {
      print('[ProductManager widget] initState');
      _products.add(widget.startingProduct);
    }
    /**
     * widget allows to access the properties of parent widget, like startingProduct
     */
  }

  void _addProducts(Map<String, String> product) {
    setState(() {
      _products.add(product);
      Toast.show("$product added", context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager widget] build');
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProducts), //add products button
        ),
        Expanded(
          child: Product(_products), //products
        ),
      ],
    );
  }
}
