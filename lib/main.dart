import 'package:flutter/material.dart';
import 'package:tech_ecommerce/controllers/product_controller.dart';
import 'package:tech_ecommerce/controllers/user_controller.dart';
import 'package:provider/provider.dart';
import 'package:tech_ecommerce/ui/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
      ],
      child: MaterialApp(
        title: 'Ecommerce',
        home: Login(),
      ),
    );
  }
}
