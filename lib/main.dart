import 'package:flutter/material.dart';
import './pages/home.dart';

void main() {
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
