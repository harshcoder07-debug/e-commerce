import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/filterbloc/filterbloc_bloc.dart';
import 'package:shopit/bloc/filterbloc/filterbloc_event.dart';
import 'package:shopit/bloc/filterbloc/filterbloc_state.dart';
import 'package:shopit/bloc/homebloc/homebloc_bloc.dart';
import 'package:shopit/bloc/homebloc/homebloc_event.dart';

class Filterchoicechip extends StatelessWidget {
  const Filterchoicechip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBlocBloc, FilterBlocState>(
      builder: (context, state) {
        if (state is! FilterLoaded) {
          return const SizedBox();
        }

        return SizedBox(
          height: 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              final isSelected = category == state.selectedCategory;

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ChoiceChip(
                  color: isSelected ? Colors.blue,
                  label: Text(category),
                  selected: isSelected,
                  showCheckmark: false,
                  onSelected: (_) {
                    context.read<FilterBlocBloc>().add(
                      SelectCategory(category),
                    );
                    context.read<HomeblocBloc>().add(
                      loadproducts(category: category),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
