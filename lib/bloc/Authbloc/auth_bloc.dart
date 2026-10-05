import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/Authbloc/auth_event.dart';
import 'package:shopit/bloc/Authbloc/auth_state.dart';
import 'package:shopit/repository/Authrepository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthRepository authRepo;

  StreamSubscription<User?>? _authSubscription;

  AuthBloc({required this.authRepo}) : super(Authinitial()) {
    on<ShowLogin>((event, emit) {
      emit(LoginState());
    });

    on<ShowSignup>((event, emit) {
      emit(SignupState());
    });

    on<loginrequest>((event, emit) async {
      emit(Authloading());

      try {
        final user = await authRepo.login(
          email: event.loginemail,
          password: event.loginpassword,
        );

        if (user != null) {
          emit(Authsucess(user));
        } else {
          emit(Authfailed("Invalid email or password"));
        }
      } on FirebaseAuthException catch (e) {
        emit(Authfailed(e.message ?? "Login failed"));
      } catch (e) {
        emit(Authfailed(e.toString()));
      }
    });

    on<Acccreaterequest>((event, emit) async {
      emit(registerloading());

      try {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.signupmail,
          password: event.Password,
        );

        emit(registersuccess(user.user!));
      } on FirebaseAuthException catch (e) {
        emit(registerfailed(e.message ?? 'Registration failed'));
      } catch (e) {
        emit(registerfailed(e.toString()));
      }
    });

    on<Authuserchnged>((event, emit) {
      emit(Authsucess(event.user));
    });

    on<AuthUserUnauthenticated>((event, emit) {
      emit(Authlogout());
    });

    on<AuthUserLogoutChanged>((event, emit) async {
      emit(Authloading());

      try {
        await _firebaseAuth.signOut();
        emit(Authlogout());
      } catch (e) {
        emit(Authfailed(e.toString()));
      }
    });

    _authSubscription = _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        add(Authuserchnged(user));
      } else {
        add(AuthUserUnauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
