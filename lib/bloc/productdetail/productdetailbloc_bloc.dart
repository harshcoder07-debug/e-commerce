import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/Model/product_model.dart' show Product;
import 'package:shopit/bloc/productdetail/productdetailbloc_event.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_state.dart' show CartUpdated, ProductdetailblocInitial, ProductdetailblocState, quantityupdated;

class ProductdetailblocBloc
    extends Bloc<ProductdetailblocEvent, ProductdetailblocState> {
  List<Product> cartproduct = [];

  ProductdetailblocBloc() : super(ProductdetailblocInitial()) {
    on<addtocart>((event, emit) {
      cartproduct.add(event.product);
      emit(CartUpdated(List.from(cartproduct)));
    });
  on<increasequantity>((event, emit) {
    event.product.quantity++;
    emit(quantityupdated(event.product));
  },);
    on<decreaseequantity>((event, emit) {
    event.product.quantity--;
    emit(quantityupdated(event.product));
  },);
  }
}


