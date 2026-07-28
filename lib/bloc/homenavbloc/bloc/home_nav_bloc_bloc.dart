import 'package:bloc/bloc.dart';
import 'package:shopit/bloc/homenavbloc/bloc/home_nav_bloc_event.dart';
import 'package:shopit/bloc/homenavbloc/bloc/home_nav_bloc_state.dart';

class HomeNavBlocBloc extends Bloc<HomeNavBlocEvent, Navigationstate> {
  HomeNavBlocBloc() : super(Navigationstate(0)) {
    on<tabchanged>(((event, emit) {
      emit(Navigationstate(event.index));
    }));
  }
}
