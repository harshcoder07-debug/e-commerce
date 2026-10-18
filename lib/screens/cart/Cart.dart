import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;
import 'package:shopit/bloc/productdetail/productdetailbloc_bloc.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_event.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_state.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: BlocConsumer<ProductdetailblocBloc, ProductdetailblocState>(
        listener: (context, state) {},
        builder: (context, state) {
          final getproduct = context.read<ProductdetailblocBloc>().cartproduct;

          // FIX: Added 'return' here so it stops and displays the centered text
          if (getproduct.isEmpty) {
            return const Center(
              child: Text("Your cart is empty", style: TextStyle(fontSize: 18)),
            );
          }

          return ListView.builder(
            itemCount: getproduct.length,
            itemBuilder: (context, index) {
              final product = getproduct[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(78, 33, 149, 243),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 70,
                  width: 200,
                  child: Row(
                    children: [
                      Image.network(product.image, fit: BoxFit.cover),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(product.name, textAlign: TextAlign.center),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<ProductdetailblocBloc>().add(
                            removefromcart(product),
                          );
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
