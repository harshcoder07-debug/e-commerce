import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http show get;
import 'package:shopit/Services/Apiservice.dart';
import 'package:shopit/bloc/homebloc/homebloc_event.dart';
import 'package:shopit/bloc/homebloc/homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  final ApiService apiService;

  HomeblocBloc(this.apiService) : super(homeintial()) {
    on<loadproducts>((event, emit) async {
      emit(homeloadingstate());

      try {
        final products = await apiService.getProducts();
        emit(homeloaded(products));
      } catch (e) {
        emit(homerror(e.toString()));
      }
    });
    on<FetchproductApi>((event, emit) async {
      emit(Filterloading());
      try {
        final respose = await http.get(
          Uri.parse("https://e-commerce-v4qt.onrender.com/productCatecogires"),
        );
        if (respose.statusCode == 200) {
          final Map<String, dynamic> data = jsonDecode(respose.body);
          emit(
            Filterloaded(
              categories: data["categories"],
              allproducts: data['products'],
              filteredproducts: data['products'], // Show all items initially
              selectedcategores: "All Curations",
            ),
          );
        } else {
          emit(Filtererror("server error : ${respose.statusCode}"));
        }
      } catch (e) {
        emit(Filtererror("network connection error "));
      }
    });

    //on selected categories choice logic
    on<Selectcategoryfilter>((event, emit) {
      if (state is Filterloaded) {
        final currentstate = state as Filterloaded;
        final newFilterlist = event.categoryname == "All Curations"
            ? currentstate.allproducts
            : currentstate.allproducts
                  .where((p) => p['category'] == event.categoryname)
                  .toList();
        emit(
          Filterloaded(
            categories: currentstate.categories,
            allproducts: currentstate.allproducts,
            filteredproducts: newFilterlist,
            selectedcategores: event.categoryname,
          ),
        );
      }
    });
  }
}