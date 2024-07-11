import 'package:flutter/material.dart';
import 'Domain/injections.dart';
import 'Presentation/product_list/product_screen.dart';

void main() {
  injectionGetIt();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: ProductScreen(),
    );
  }
}
