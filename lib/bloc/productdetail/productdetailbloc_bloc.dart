import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shopit/Model/product_model.dart';

import 'package:shopit/bloc/productdetail/productdetailbloc_event.dart';

import 'package:shopit/bloc/productdetail/productdetailbloc_state.dart';

class ProductdetailblocBloc
    extends Bloc<ProductdetailblocEvent, ProductdetailblocState> {

  List<Product> cartproduct = [];

  Set<int> favoriteIds = {};

  static const String favoriteKey = 'favorite_products';

  ProductdetailblocBloc()
      : super(ProductdetailblocInitial()) {

    // ADD TO CART
    on<addtocart>((event, emit) {
      cartproduct.add(event.product);

      emit(CartUpdated(List.from(cartproduct)));
    });

  
    on<increasequantity>((event, emit) {
      event.product.quantity++;

      emit(quantityupdated(event.product));
    });

  
    on<decreaseequantity>((event, emit) {
      if (event.product.quantity > 1) {
        event.product.quantity--;

        emit(quantityupdated(event.product));
      }
    });

   
    on<removefromcart>((event, emit) {
      cartproduct.remove(event.product);

      emit(CartUpdated(List.from(cartproduct)));
    });

  
   on<loadfav>((event, emit) async {

      final prefs = await SharedPreferences.getInstance();

      final savedIds =
          prefs.getStringList(favoriteKey) ?? [];

      favoriteIds = savedIds.map(int.parse).toSet();

      for (var product in event.products) {
        product.isfav = favoriteIds.contains(product.id);
      }

      emit(favloaded(List.from(event.products)));
    });

    on<isfav>((event, emit) async {

      final product = event.product;

      if (favoriteIds.contains(product.id)) {

        favoriteIds.remove(product.id);

        product.isfav = false;

      } else {

        favoriteIds.add(product.id);

        product.isfav = true;
      }

      final prefs = await SharedPreferences.getInstance();

      await prefs.setStringList(
        favoriteKey,
        favoriteIds.map((id) => id.toString()).toList(),
      );

      emit(
        favstate(
          product: product,
          isfav: product.isfav,
        ),
      );
    });
  }
}