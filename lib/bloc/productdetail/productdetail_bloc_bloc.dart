import 'package:bloc/bloc.dart';
import 'package:shopit/Model/product_model.dart';
import 'package:shopit/bloc/productdetail/productdetail_bloc_event.dart';
import 'package:shopit/bloc/productdetail/productdetail_bloc_state.dart';

class ProductdetailBlocBloc
    extends Bloc<ProductdetailBlocEvent, ProductdetailBlocState> {
  final List<Product> cartproduct = [];
  ProductdetailBlocBloc() : super(ProductdetailBlocState()) {
    on<addtocart>((event, emit) {
      emit(addtowishlistloading());
      cartproduct.add(event.product);
    });
    on<removefromcart>((event, emit) {
      emit(removetocartloading());
      cartproduct.remove(event.product);
    });
  }
}
