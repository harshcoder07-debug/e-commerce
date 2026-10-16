import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;
import 'package:shopit/Model/product_model.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_bloc.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_state.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: BlocConsumer<ProductdetailblocBloc, ProductdetailblocState>(
        listener: (context, state) {},
        builder: (context, state) {
          final getproduct = context.read<ProductdetailblocBloc>().cartproduct;
          if (getproduct.isEmpty) {
            Center(child: Text("Your cart is empty"));
          }
          return ListView.builder(
            itemCount: getproduct.length,
            itemBuilder: (context, index) {
              final product = getproduct[index];
              return ListTile(
                leading: Image.network(product.image),
                title: Text(product.name),
              );
            },
          );
        },
      ),
    );
  }
}
