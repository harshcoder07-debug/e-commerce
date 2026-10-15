import 'package:bloc/bloc.dart';
import 'package:shopit/Model/product_model.dart';

import 'productdetailbloc_event.dart';
import 'productdetailbloc_state.dart';

class ProductdetailblocBloc
    extends Bloc<ProductdetailblocEvent, ProductdetailblocState> {

  List<Product> cartproduct = [];

  ProductdetailblocBloc() : super(ProductdetailblocInitial()) {

    on<addtocart>((event, emit) {
      cartproduct.add(event.product);

      emit(CartUpdated(List.from(cartproduct)));
    });
  }
}