import 'package:shopit/Model/product_model.dart';

class ProductdetailBlocEvent {}

class Addtowishlist extends ProductdetailBlocEvent {}

class removefromwishlisht extends ProductdetailBlocEvent {}

class addtocart extends ProductdetailBlocEvent {
  final Product product;

  addtocart(this.product);
}

class removefromcart extends ProductdetailBlocEvent {
  final Product product;

  removefromcart(this.product);
}
