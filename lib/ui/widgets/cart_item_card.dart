import 'package:flutter/material.dart';
import 'package:tech_ecommerce/models/product_model.dart';
import 'package:tech_ecommerce/ui/styles/styles.dart';

class CartItem extends StatefulWidget {
  final ProductModel product;

  const CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Color(0xA3A3A3A3))
            )
          ),
          child: Row(
            children: [
              Image.network(
                widget.product.pictureURL,
                fit: BoxFit.contain,
                width: 150,
                height: 150,
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.product.name, style: fontApp(16)),
                  const SizedBox(height: 10),
                  Text(widget.product.description, style: fontApp(12)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: _decrementQuantity,
                      ),
                      Text('$_quantity'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: _incrementQuantity,
                      ),
                      const SizedBox(width: 20),
                      Text(" R\$ ${widget.product.price * _quantity}", style: fontApp(20)),
                    ],
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}