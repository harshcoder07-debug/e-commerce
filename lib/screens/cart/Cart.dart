import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;
import 'package:shopit/bloc/productdetail/productdetailbloc_bloc.dart';
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

          
          if (getproduct.isEmpty) {
            return const Center(
              child: Text("Your cart is empty", style: TextStyle(fontSize: 18)),
            );
          }

          return ListView.builder(
            itemCount: getproduct.length,
            itemBuilder: (context, index) {
              final product = getproduct[index];
              return Container(
                color: Colors.transparent,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.black,
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.white24,
                                ),
                              ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 38,

                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.remove),
                                      constraints: BoxConstraints(),
                                    ),
                                    Text('${product.quantity}'),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.add),
                                      constraints: BoxConstraints(),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(onTap: () {
                                
                              },child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  
                                  Icon(Icons.delete),
                                  Text("Remove")],),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
