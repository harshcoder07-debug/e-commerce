import 'package:bloc/bloc.dart';
import 'package:shopit/Services/Apiservice.dart';
import 'package:shopit/bloc/homebloc/homebloc_event.dart';
import 'package:shopit/bloc/homebloc/homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  final ApiService apiService;

  HomeblocBloc(this.apiService) : super(homeintial()) {
    on<loadproducts>((event, emit) async {
      emit(homeloadingstate());

      try {
        final products = await apiService.getProducts(
          category: event.category,
        );

        print('Products fetched: ${products.length}');

        emit(homeloaded(products));
      } catch (e, stackTrace) {
        print('Product fetch error: $e');
        print(stackTrace);

        emit(homerror(e.toString()));
      }
    });


    add(loadproducts());
  }
}