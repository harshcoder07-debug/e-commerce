import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_bloc.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_state.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.blue,
        foregroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: BlocBuilder<ProductdetailblocBloc, ProductdetailblocState>(
        builder: (context, state) {
          final bloc = context.read<ProductdetailblocBloc>();
          final products = bloc.cartproduct;

          if (products.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    product.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) =>
                        const Icon(Icons.image_not_supported),
                  ),
                  title: Text(product.name),
                  
                  
                ),
              );
            },
          );
        },
      ),
    );
  }
}