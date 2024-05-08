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
    if (email.isNotEmpty && email.contains('@')){
      UserModel user = UserModel(email: email, password: password);
      notifyListeners();
      userDatabase.users.add(user);
      login(context, email, password);
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Credenciais inválidas'),
        )
      );
    }
  }

  void login(context, String email, String password){
    var users = userDatabase.users;
    var result = users.where((user) => user.email == email);
    notifyListeners();
    if (result.isNotEmpty) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage(userName: email)));
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