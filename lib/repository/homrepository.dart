import 'package:shopit/Model/product_model.dart';
import 'package:shopit/Services/Apiservice.dart';

class Homrepository {
  final ApiService apiService = ApiService();
  Future<List<Product>> getproduct() {
    return apiService.getProducts();
  }
}
