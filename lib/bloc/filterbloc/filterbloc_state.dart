abstract class FilterBlocState {}

class FilterLoading extends FilterBlocState {}

class FilterLoaded extends FilterBlocState {
  final List<String> categories;
  final String selectedCategory;

  FilterLoaded({
    required this.categories,
    required this.selectedCategory,
  });
}

class FilterError extends FilterBlocState {
  final String message;

  FilterError(this.message);
}