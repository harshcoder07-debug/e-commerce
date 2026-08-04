import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shopit/bloc/filterbloc/filterbloc_event.dart';
import 'package:shopit/bloc/filterbloc/filterbloc_state.dart';


class FilterBlocBloc extends Bloc<FilterBlocEvent, FilterBlocState> {
  FilterBlocBloc() : super(FilterLoading()) {

    on<LoadCategories>((event, emit) async {
      emit(FilterLoading());

      try {
        final response = await http.get(
          Uri.parse(
            "https://e-commerce-v4qt.onrender.com/productCatecogires",
          ),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          emit(
            FilterLoaded(
              categories: List<String>.from(data["categories"]),
              selectedCategory: "All Categories",
            ),
          );
        } else {
          emit(FilterError("Server Error"));
        }
      } catch (e) {
        emit(FilterError(e.toString()));
      }
    });

    on<SelectCategory>((event, emit) {
      if (state is FilterLoaded) {
        final current = state as FilterLoaded;

        emit(
          FilterLoaded(
            categories: current.categories,
            selectedCategory: event.category,
          ),
        );
      }
    });
  }
}