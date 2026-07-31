import 'package:shopit/Model/product_model.dart';

class HomeblocState {
  const HomeblocState();
}

// /home intial State
class homeintial extends HomeblocState {}

// home loadingstate
class homeloadingstate extends HomeblocState {}

//home loaded state
class homeloaded extends HomeblocState {
  final List<Product> product;

  const homeloaded(this.product);
}

//home error state
class homerror extends HomeblocState {
  final String errormsg;

  homerror(this.errormsg);
}
//