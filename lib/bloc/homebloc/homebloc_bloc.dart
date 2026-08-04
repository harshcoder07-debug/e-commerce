import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopit/Services/Apiservice.dart';
import 'package:shopit/bloc/homebloc/homebloc_event.dart';
import 'package:shopit/bloc/homebloc/homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  final ApiService apiService;

  HomeblocBloc(this.apiService) : super(homeintial()) {
    on<loadproducts>((event, emit) async {
      emit(homeloadingstate());

      try {
        final products = await apiService.getProducts(category: event.category);
        emit(homeloaded(products));
      } catch (e) {
        emit(homerror(e.toString()));
      }
    });
  }
}
