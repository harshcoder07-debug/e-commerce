import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/Model/product_model.dart';

import 'package:shopit/bloc/productdetail/productdetailbloc_bloc.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_event.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_state.dart';

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
              style: const TextStyle(fontSize: 18, color: Colors.white),
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productdetail.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(productdetail.description),
            ),
            BlocConsumer<ProductdetailblocBloc, ProductdetailblocState>(
              listener: (context, state) {
                // Assuming 'addtocart' is a state name in your productdetailbloc_state.dart
                if (state is addtocart) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Product added Successfully",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Row(
                  children: [
                     CircleAvatar(
                      backgroundColor:Colors.blue,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.add))),
                     CircleAvatar(
                       backgroundColor:Colors.blue,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.remove))),
                    GestureDetector(
                      onTap: () {
                       
                        BlocProvider.of<ProductdetailblocBloc>(context)
                            .add(addtocart(productdetail));
                      },
                      
                      child: Container(
                        height: 50,
                        width: 150, 
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
