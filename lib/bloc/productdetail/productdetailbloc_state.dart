import 'package:shopit/Model/product_model.dart';

abstract class ProductdetailblocState {}

class ProductdetailblocInitial extends ProductdetailblocState {}

class CartUpdated extends ProductdetailblocState {
  final List<Product> products;

  CartUpdated(this.products);
}
