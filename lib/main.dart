import 'package:assessment/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/login_provider.dart';
import '../providers/register_provider.dart';
import '../screens/register_screen.dart';
import '../screens/product_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>RegisterProvider()),
      ChangeNotifierProvider(create: (context)=>LoginProvider()),
      ChangeNotifierProvider(create: (context)=>ProductProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    ),
    );
  }
}