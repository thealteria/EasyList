import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import './ui/home.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(
    new MaterialApp(
      title: "EasyList",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, accentColor: Colors.deepPurple),
      home: new Home(),
    ),
  );
}
