import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopit/Model/product_model.dart';

import 'package:shopit/bloc/productdetail/productdetailbloc_bloc.dart';

import 'package:shopit/bloc/productdetail/productdetailbloc_event.dart';

import 'package:shopit/bloc/productdetail/productdetailbloc_state.dart';

import 'package:shopit/screens/home/productdetial.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Productdetial(productdetail: product),
                ),
              );
            },

            child: Stack(
              children: [
                Card(
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(32),
                  ),

                  child: Image.network(
                    product.image,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),

                // FAVORITE BUTTON
                Positioned(
                  top: 8,
                  right: 8,
                  child:
                      BlocBuilder<
                        ProductdetailblocBloc,
                        ProductdetailblocState
                      >(
                        builder: (context, state) {
                          final isFavorite = product.isfav;

                          return IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.blue[100],
                              minimumSize: const Size(40, 40),
                            ),
                            onPressed: () {
                              context.read<ProductdetailblocBloc>().add(
                                isfav(product)
                              );
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                              size: 22,
                            ),
                          );
                        },
                      ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                      height: 35,

                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blue,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],

                        color: const Color.fromARGB(151, 10, 71, 240),

                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(5),

                        child: Text(
                          product.name,

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),

                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8),

                        child: Text(
                          "${product.price} ₹",

                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Text(
                product.description,
                maxLines: 2,

                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
