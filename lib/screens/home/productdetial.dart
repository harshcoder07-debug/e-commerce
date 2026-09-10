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
            SizedBox(
              width: double.infinity,
              height: 350,
              child: Image.network(productdetail.image, fit: BoxFit.contain),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productdetail.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
