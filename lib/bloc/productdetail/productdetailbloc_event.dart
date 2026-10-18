import 'package:shopit/Model/product_model.dart';

abstract class ProductdetailblocEvent {}

class addtocart extends ProductdetailblocEvent {
  final Product product;

  addtocart(this.product);
}

class removefromcart extends ProductdetailblocEvent {
  final Product product;

  removefromcart(this.product);
}

class increasequantity extends ProductdetailblocEvent {
  final Product product;

  increasequantity(this.product);
}

class decreaseequantity extends ProductdetailblocEvent {
  final Product product;

  decreaseequantity(this.product);
}
class isfav extends ProductdetailblocEvent{
  final Product product;

  isfav(this.product);
}