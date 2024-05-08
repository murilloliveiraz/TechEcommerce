import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_ecommerce/controllers/product_controller.dart';
import 'package:tech_ecommerce/controllers/user_controller.dart';
import 'package:tech_ecommerce/models/product_model.dart';
import 'package:tech_ecommerce/ui/pages/favorites.dart';
import 'package:tech_ecommerce/ui/pages/shopping_cart.dart';
import 'package:tech_ecommerce/ui/styles/styles.dart';
import 'package:tech_ecommerce/ui/widgets/card.dart';
import 'package:tech_ecommerce/ui/widgets/carousel.dart';

class HomePage extends StatefulWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce', style: fontApp(18)),
        actions: [
          IconButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Favorites()));
                  }, icon: const Icon(Icons.favorite)),
          IconButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ShoppingCart()));
                  }, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Column(
        children: [
          const Carousel(),
          const SizedBox(height: 10),
          Text("Ofertas e Promoções", style: fontApp(22)),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer2<ProductController, UserController>(
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
                    return ProductCard(product: products[index], userController: userController, userName: widget.userName,);
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
