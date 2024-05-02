import 'package:tech_ecommerce/models/product_model.dart';

class UserModel {
  String email;
  String password;
  List<ProductModel> products = [];
  List<ProductModel> favorites = [ProductModel(name: 'Macbook', price: 7989.00, description: 'M3', pictureURL: 'https://m.media-amazon.com/images/G/32/apple/NPI/Jun_22/Family_Stripe/AMZ_FamilyStripe_MacBook_Pro_13_in._CB633575652_.png'),
    ];

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