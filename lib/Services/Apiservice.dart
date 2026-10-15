import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopit/Model/product_model.dart';

class ApiService {
  Future<List<Product>> getProducts({
    String category = 'All Categories',
  }) async {
    final uri = Uri.https(
      'e-commerce-v4qt.onrender.com',
      '/products',
      {'category': category},
    );

    print('API URL: $uri');

    final response = await http
        .get(uri)
        .timeout(const Duration(seconds: 30));

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      if (decoded is! List) {
        throw Exception(
          'Expected a JSON list, received ${decoded.runtimeType}',
        );
      }

      return decoded
          .map<Product>(
            (item) => Product.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    }

    throw Exception(
      'Failed to load products: HTTP ${response.statusCode}',
    );
  }
}