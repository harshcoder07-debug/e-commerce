import 'package:flutter/material.dart';
import 'package:shopit/Model/product_model.dart';

class Productdetial extends StatelessWidget {
  final Product productdetail;
  const Productdetial({super.key, required this.productdetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productdetail.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              child: Image.network(productdetail.image, fit: BoxFit.contain),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(productdetail.price.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
