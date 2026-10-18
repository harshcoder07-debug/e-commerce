import 'package:flutter/material.dart';
import 'package:shopit/Model/product_model.dart';

abstract class ProductdetailblocState {}

class ProductdetailblocInitial extends ProductdetailblocState {}

class CartUpdated extends ProductdetailblocState {
  final List<Product> products;

  CartUpdated(this.products);
}


//quantity update
class quantityupdated extends ProductdetailblocState {
  final Product product;

  quantityupdated(this.product);
}


///fav state mange
class favstate extends ProductdetailblocState {
  final Product product;
  final bool isfav;

  favstate({
    required this.product,
    required this.isfav,
  });
}
