import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopit/Model/product_model.dart';

class ApiService {
  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse("https://e-commerce-v4qt.onrender.com/products"),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    }

    throw Exception("Failed");
  }
}
