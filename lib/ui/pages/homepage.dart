import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_ecommerce/controllers/product_controller.dart';
import 'package:tech_ecommerce/controllers/user_controller.dart';
import 'package:tech_ecommerce/models/product_model.dart';
import 'package:tech_ecommerce/ui/pages/favorites.dart';
import 'package:tech_ecommerce/ui/pages/shopping_cart.dart';
import 'package:tech_ecommerce/ui/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(onPressed: () {
                  Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (_)=> const Favorites()),
                  (route) => false);
                  }, icon: const Icon(Icons.favorite)),
          IconButton(onPressed: () {
                  Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (_)=> const ShoppingCart()),
                  (route) => false);
                  }, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Consumer2<ProductController, UserController>(
        builder: (context, productController, userController, child){
          List<ProductModel> products = productController.products;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index], userController: userController);
            },
          );
        }
      ),
    );
  }
}
