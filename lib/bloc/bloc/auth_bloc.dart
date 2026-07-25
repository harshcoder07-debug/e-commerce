import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/repository/Authrepository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository? authrepo;
  AuthBloc({this.authrepo}) : super(Authinitial()) {
    on<ShowLogin>((event, emit) {
      emit(LoginState());
    });

    on<ShowSignup>((event, emit) {
      emit(SignupState());
    });

    on<loginrequest>((event, emit) async {
      emit(Authloading());
      try {
        await authrepo!.login(
          email: event.loginemail,
          password: event.loginpassword,
        );
        emit(Authsucess());
      } catch (e) {
        emit(Authfailed(e.toString()));
      }
    });
  }
}
