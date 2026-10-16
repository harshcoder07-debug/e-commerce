import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopit/bloc/homebloc/homebloc_bloc.dart' show HomeblocBloc;
import 'package:shopit/bloc/homebloc/homebloc_event.dart';

import 'package:shopit/bloc/homebloc/homebloc_state.dart';
import 'package:shopit/widgets/Productcard.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeblocBloc>().add(loadproducts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeblocBloc, HomeblocState>(
      builder: (context, state) {
        if (state is homeintial || state is homeloadingstate) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if (state is homeloaded) {
          if (state.product.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('No products found in API')),
            );
          }

          return SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ProductCard(product: state.product[index]);
            }, childCount: state.product.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
          );
        }

        if (state is homerror) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${state.errormsg}')),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
