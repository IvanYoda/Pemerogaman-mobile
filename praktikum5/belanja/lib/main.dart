import 'package:flutter/material.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(), // Correct arrow function syntax
      '/item': (context) => ItemPage(), // Correct arrow function syntax
    },
  ));
}

