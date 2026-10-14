 import 'package:shopit/Model/product_model.dart';

class ProductdetailBlocState {}

class productdetailinitial extends ProductdetailBlocState {}

//addwishlist
class addtowishlistinitial extends ProductdetailBlocState {}

class addtowishlistsucces extends ProductdetailBlocState {}

class addtowishlistloading extends ProductdetailBlocState {}

class Addtowishlisterror extends ProductdetailBlocState {}
//remove
class removetowishlistinitial extends ProductdetailBlocState {}

class removetowishlistsucces extends ProductdetailBlocState {}

class removetowishlistloading extends ProductdetailBlocState {}

class removetowishlisterror extends ProductdetailBlocState {final String error;

  removetowishlisterror(this.error);}
//addcart

class aadtocartinitial extends ProductdetailBlocState {}

class aadtocartloading extends ProductdetailBlocState {}

class aadtocartsuccess extends ProductdetailBlocState {final List<Product> product;

  aadtocartsuccess(this.product);}

//removecart

class removetocartinitial extends ProductdetailBlocState {}

class removetocartloading extends ProductdetailBlocState {}

class removetocartsucess extends ProductdetailBlocState {final List<Product> product;

  removetocartsucess(this.product);}