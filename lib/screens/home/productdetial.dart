
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/Model/product_model.dart';

import 'package:shopit/bloc/productdetail/productdetailbloc_bloc.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_event.dart';
import 'package:shopit/bloc/productdetail/productdetailbloc_state.dart';

class Productdetial extends StatelessWidget {
  final Product productdetail;

  const Productdetial({
    super.key,
    required this.productdetail,
  });

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
              "Merchnat",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        elevation: 6,
        backgroundColor: Colors.blue,
      ),

      // Product details scroll honge
      body: BlocConsumer<ProductdetailblocBloc,
          ProductdetailblocState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Image.network(
                    productdetail.image,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productdetail.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),

                      BlocBuilder<ProductdetailblocBloc,
                          ProductdetailblocState>(
                        builder: (context, state) {
                          final isFavorite =
                              state is favstate &&
                                      identical(
                                        state.product,
                                        productdetail,
                                      )
                                  ? state.isfav
                                  : productdetail.isfav;

                          return IconButton(
                            onPressed: () {
                              context
                                  .read<ProductdetailblocBloc>()
                                  .add(isfav(productdetail));
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: isFavorite
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(productdetail.description),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

     
      bottomNavigationBar: SafeArea(
        child: BlocConsumer<ProductdetailblocBloc,
            ProductdetailblocState>(
          listener: (context, state) {
            if (state is CartUpdated) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: const Color.fromARGB(
                      255,
                      3,
                      66,
                      238,
                    ),
                    elevation: 0,
                    duration: const Duration(seconds: 2),
                    content: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 40,
                      width: 300,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                          ),
                          Text(
                            "Product Added succesfully",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withValues(
                            alpha: 0.2,
                          ),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<ProductdetailblocBloc>()
                                  .add(increasequantity(
                                      productdetail));
                            },
                            icon: Icon(Icons.add),
                          ),
                        ),

                        SizedBox(width: 10),

                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<ProductdetailblocBloc>()
                                  .add(decreaseequantity(
                                      productdetail));
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ),

                        SizedBox(width: 10),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(30),
                            color: Colors.blue,
                          ),
                          height: 40,
                          width: 100,
                          child: Center(
                            child: Text(
                              '${productdetail.quantity}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      context
                          .read<ProductdetailblocBloc>()
                          .add(addtocart(productdetail));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
