abstract class FilterBlocEvent {}

class FetchproductApi extends FilterBlocEvent {}

class Selectcategoryfilter extends FilterBlocEvent {
  final String categoryname;

  Selectcategoryfilter(this.categoryname);
}
