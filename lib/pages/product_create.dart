import 'package:flutter/material.dart';

class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Save"),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Center(
                child: Text("Modal"),
              );
            },
          );
        },
      ),
    );
  }
}
