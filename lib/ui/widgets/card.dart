import 'package:flutter/material.dart';
import 'package:tech_ecommerce/controllers/user_controller.dart';
import 'package:tech_ecommerce/models/product_model.dart';
import 'package:tech_ecommerce/ui/styles/styles.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  final UserController userController;

  const ProductCard({super.key, required this.product, required this.userController});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 220,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0 ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.product.pictureURL,
                      fit: BoxFit.contain,
                      width: 200,
                      height: 130,
                    ),
                    ListTile(
                      title: Text(widget.product.name, style: fontApp(16)),
                      subtitle: Text("R\$ ${widget.product.price}"),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite; 
                            if (isFavorite) {
                              widget.userController.addFavorite("murillo@gmail.com", widget.product);
                            } else {
                              widget.userController.removeFavorite("murillo@gmail.com", widget.product);
                            }
                          });
                        },
                        icon: isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_outline),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    widget.userController.addToShoppingCart("murillo@gmail.com", widget.product);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text('Comprar', style: fontAppWhite(16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
