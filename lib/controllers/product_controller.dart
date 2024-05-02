import 'package:flutter/material.dart';
import 'package:tech_ecommerce/models/product_model.dart';

class ProductController with ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(name: 'Macbook', price: 7989.00, description: 'M3', pictureURL: 'https://m.media-amazon.com/images/G/32/apple/NPI/Jun_22/Family_Stripe/AMZ_FamilyStripe_MacBook_Pro_13_in._CB633575652_.png'),
    ProductModel(name: 'iPhone 13', price: 3499.00, description: '128GB', pictureURL: 'https://m.media-amazon.com/images/I/41rfDU6FGqL._AC_UF1000,1000_QL80_.jpg'),
    ProductModel(name: 'Samsung Galaxy S22', price: 4299.00, description: '256GB', pictureURL: 'https://benchpromos.com.br/_next/image?url=https%3A%2F%2Fmedia.discordapp.net%2Fattachments%2F777641614423752770%2F1177456358082220144%2FGJEyeeVVUVGqJRO7zAGbWCyBdJBCQCYxBxsZG7cknn0yR1sdqWUJJQK5iYAk6NxsN1lqiYBEQCIgEchzBCRB53kDypJBCQCEgGJQG4iIAk6N9tNlloiIBGQCEgE8hwBSdB53sCyehIBiYBEQCKQmwhIgs7NdpOllghIBCQCEoE8R0ASdJ43sKyeREAiIBGQCOQmApKgc7PdZKklAhIBiYBEIM8RkASd5w0sqycRkAhIBCQCuYmAJOjcbDdZaomAREAiIBHIcwQkQed5A8vqSQQkAhIBiUBuIiAJOjfbTZZaIiARkAhIBPIcAUnQed7AsnoSAYmAREAikJsISILOzXaTpZYISAQkAhKBPEdAEnSeN7CsnkRAIiARkAjkJgKSoHOz3WSpJQISAYmARCDPEZAEnecNLKsnEZAISAQkArmJgCTo3Gw3WWqJgERAIiARyHMEJEHneQPL6kkEJAISAYlAbiIgCTo3202WWiIgEZAISATyHAFJ0HnewLJ6E..png%3Fformat%3Dwebp&w=3840&q=75'),
    ProductModel(name: 'Apple Watch S3', price: 2999.00, description: 'Gray', pictureURL: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT3D3ref_VW_34FR+watch-case-44-aluminum-midnight-nc-se_VW_34FR+watch-face-44-aluminum-midnight-se_VW_34FR?wid=2000&hei=2000&fmt=png-alpha&.v=1694507496485')
  ];

  List<ProductModel> get products => _products;
}
