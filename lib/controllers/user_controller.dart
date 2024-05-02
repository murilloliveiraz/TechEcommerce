import 'package:flutter/material.dart';
import 'package:tech_ecommerce/database/user_database.dart';
import 'package:tech_ecommerce/models/product_model.dart';
import 'package:tech_ecommerce/models/user_model.dart';
import 'package:tech_ecommerce/ui/pages/homepage.dart';

class UserController with ChangeNotifier {
  UserDatabase userDatabase = UserDatabase();

  void addToShoppingCart(String userEmail, ProductModel product){
    UserModel? user = userDatabase.users.firstWhere((user) => user.email == userEmail);
    if (user.email.isNotEmpty){
     user.addProduct(product);
    }
  }

  void addFavorite(String userEmail, ProductModel product){
    UserModel? user = userDatabase.users.firstWhere((user) => user.email == userEmail);
    if(user.email.isNotEmpty){
      user.addFavorite(product);
    }
  }

  void removeFavorite(String userEmail, ProductModel product){
    UserModel? user = userDatabase.users.firstWhere((user) => user.email == userEmail);
    if(user.email.isNotEmpty){
      user.removeFavorite(product);
    }
  }

  void signIn(context, String email, String password){
    var user = UserModel(email: email, password: password);
    notifyListeners();
    userDatabase.users.add(user);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
  }

  void login(context, String email, String password){
    var users = userDatabase.users;
    var result = users.where((user) => user.email == email);
    //UserModel user = UserModel(email: email, password: password);
    notifyListeners();
    if (result.isNotEmpty) {
      Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_)=> const HomePage()),
        (route) => false);
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Senha Inválida'),
        )
      );
    }
  }

  Future<List<ProductModel>> favoriteProductsUser(index) async
  {
  return userDatabase.users[index].favorites;
  }

  Future<List<ProductModel>> shoppingCartUser(index) async
  {
  return userDatabase.users[index].products;
  }
}