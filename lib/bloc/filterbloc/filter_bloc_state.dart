class FilterBlocState {}

class Filterloading extends FilterBlocState {}

class Filterloaded extends FilterBlocState {
  final List<dynamic> categories;
  final List<dynamic> allproducts;
  final List<dynamic> filteredproducts;
  final String selectedcategores;
  Filterloaded({
    required this.categories,
    required this.allproducts,
    required this.filteredproducts,
    required this.selectedcategores
  });
}

class Filtererror extends FilterBlocState {
  final String error;

  Filtererror(this.error);
}
