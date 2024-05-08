import 'package:tech_ecommerce/models/product_model.dart';

class UserModel {
  String email;
  String password;
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];

  UserModel({required this.email, required this.password});

  void addProduct(ProductModel product){
    products.add(product);
  }

  void removeProduct(int id){
    ProductModel product = products[id];
    products.remove(product);
  }

  void addFavorite(ProductModel product){
    if(!favorites.contains(product)) favorites.add(product);
  }

  void removeFavorite(ProductModel product){
    if(favorites.contains(product)) favorites.remove(product);
  }
}