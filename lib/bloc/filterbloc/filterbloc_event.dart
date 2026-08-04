abstract class FilterBlocEvent {}

class LoadCategories extends FilterBlocEvent {}

class SelectCategory extends FilterBlocEvent {
  final String category;

  SelectCategory(this.category);
}