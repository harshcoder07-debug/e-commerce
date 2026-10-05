import 'package:bloc/bloc.dart';
import 'package:shopit/bloc/homenavbloc/bloc/home_nav_bloc_event.dart';
import 'package:shopit/bloc/homenavbloc/bloc/home_nav_bloc_state.dart';

class HomeNavBlocBloc extends Bloc<HomeNavBlocEvent, Navigationstate> {
  HomeNavBlocBloc()
      : super(
          Navigationstate(
            selectedindex: 0,
            isnavvisibl: true,
          ),
        ) {
    on<tabchanged>((event, emit) {
      emit(
        state.copyWith(
          selectedindex: event.index,
          isnavvisibl: true,
        ),
      );
    });

    on<navhide>((event, emit) {
      emit(
        state.copyWith(
          isnavvisibl: false,
        ),
      );
    });

    on<navshow>((event, emit) {
      emit(
        state.copyWith(
          isnavvisibl: true,
        ),
      );
    });
  }
}