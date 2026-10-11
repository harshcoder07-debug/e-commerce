import 'package:flutter/material.dart';
import 'package:shopit/Model/product_model.dart';

class Productdetial extends StatelessWidget {
  final Product productdetail;
  const Productdetial({super.key, required this.productdetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.lightBlue,
        title: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 10,
                color: const Color.fromARGB(255, 28, 144, 240),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 6, 128, 205),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 5,
              bottom: 5,
            ),
            child: Text(
              productdetail.name,
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          ),
        ),
        elevation: 6,
        backgroundColor: Colors.blue,
      ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(productdetail.description),
            ),
          ],
        ),
      ),
    );
  }
}
