class HomeblocEvent {}
class loadproducts extends HomeblocEvent{}
class FetchproductApi extends HomeblocEvent {}

class Selectcategoryfilter extends HomeblocEvent {
  final String categoryname;

  Selectcategoryfilter(this.categoryname);
}
