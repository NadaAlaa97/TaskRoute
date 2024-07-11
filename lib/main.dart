import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Domain/injections.dart';
import 'Presentation/product_list/product_screen.dart';

void main() {
  injectionGetIt();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ScreenUtilInit(
      designSize: Size(490, 950),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        home: ProductScreen(),
      ),
    );
  }
}
