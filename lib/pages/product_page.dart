import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure?"),
          content: Text("This action can't be undone!"),
          actions: <Widget>[
            FlatButton(
              child: Text("Discard"),
              onPressed: () {
                Navigator.pop(context);
                Toast.show("Product not deleted!", context);
              },
            ),
            FlatButton(
              child: Text("Delete"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
                Toast.show("Product deleted!", context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        print("back button pressed!");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Detail"),
        ),
        body: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageUrl),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(title),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => _showWarningDialog(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
