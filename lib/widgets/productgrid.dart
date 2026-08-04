import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/homebloc/homebloc_bloc.dart';
import 'package:shopit/bloc/homebloc/homebloc_state.dart';
import 'package:shopit/widgets/Productcard.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeblocBloc, HomeblocState>(
      builder: (context, state) {
        if (state is homeloadingstate) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is homeloaded) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final product = state.product[index];
              return ProductCard(product: product);
            }, childCount: state.product.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.8,
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
