class HomeblocEvent {}

class loadproducts extends HomeblocEvent {
  final String category;

  loadproducts({this.category = "All Categories"});
}
