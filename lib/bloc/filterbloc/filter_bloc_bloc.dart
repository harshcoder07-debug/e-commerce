import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopit/bloc/filterbloc/filter_bloc_event.dart';
import 'package:shopit/bloc/filterbloc/filter_bloc_state.dart';

class FilterBlocBloc extends Bloc<FilterBlocEvent, FilterBlocState> {
  FilterBlocBloc() : super(Filterloading()) {
    on<FetchproductApi>((event, emit) async {
      emit(Filterloading());
      try {
        final respose = await http.get(
          Uri.parse("https://e-commerce-v4qt.onrender.com/products"),
        );
        if (respose.statusCode == 200) {
          final Map<String, dynamic> data = jsonDecode(respose.body);
          emit(
            Filterloaded(
              categories: data["Categories"],
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
                  .where((p) => p['Categories'] == event.categoryname)
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
