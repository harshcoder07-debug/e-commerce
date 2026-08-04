import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/homebloc/homebloc_bloc.dart';
import 'package:shopit/bloc/homebloc/homebloc_event.dart';
import 'package:shopit/bloc/homebloc/homebloc_state.dart';

class Filterchoicechip extends StatelessWidget {
  const Filterchoicechip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeblocBloc, HomeblocState>(
      builder: (context, state) {
        if (state is! homeloaded) {
          return const SizedBox();
        }

        return SizedBox(
          height: 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final category = state.categories[index];
              final isSelected = category == state.selectedcategores;

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  showCheckmark: false,
                  onSelected: (_) {
                    context.read<HomeblocBloc>().add(
                      Selectcategoryfilter(category),
                    );
                  },
                  backgroundColor: Colors.grey.shade200,
                  selectedColor: Colors.blue,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
