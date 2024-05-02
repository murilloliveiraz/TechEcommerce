import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_ecommerce/controllers/user_controller.dart';
import 'package:tech_ecommerce/models/product_model.dart';
import 'package:tech_ecommerce/ui/widgets/cart_item_card.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: userProvider.shoppingCartUser(0),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){
            List<ProductModel>? myProducts = snapshot.data;
            if (myProducts!.isEmpty){
              return const Text('Sem dados');
            }
            return ListView.builder(
              itemCount: myProducts.length,
              itemBuilder: (context, index) {
                return CartItem(product: myProducts[index]);
              }
            );
          }
          return const Text('Sem dados');
        },
      ),
    );
  }
}