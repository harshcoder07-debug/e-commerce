import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/bloc/bloc/auth_event.dart';
import 'package:shopit/bloc/bloc/auth_state.dart';
import 'package:shopit/repository/Authrepository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final AuthRepository authRepo;

  StreamSubscription<User?>? _authSubscription;

  AuthBloc({required this.authRepo}) : super(Authinitial()) {
    // Listen for authentication state changes
    _authSubscription = _firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        add(Authuserchnged(user));
      } else {
        // 1. FIX: Dispatch a state change event, NOT the active logout process
        add(AuthUserUnauthenticated());
      }
    });

    // Show Login Screen
    on<ShowLogin>((event, emit) => emit(LoginState()));

    // Show Signup Screen
    on<ShowSignup>((event, emit) => emit(SignupState()));

    // Login
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

    // User authenticated
    on<Authuserchnged>((event, emit) {
      emit(Authsucess(event.user));
    });

    // 2. FIX: Event fired automatically when Firebase stream says user is null
    on<AuthUserUnauthenticated>((event, emit) {
      emit(
        Authlogout(),
      ); // Just update the UI state, do not call signOut() here!
    });

    // 3. FIX: Event fired ONLY when user taps "Logout" button in UI
    on<AuthUserLogoutChanged>((event, emit) async {
      emit(Authloading());
      try {
        // This triggers authStateChanges().listen to fire null,
        // which handles emitting Authlogout() via AuthUserUnauthenticated
        await _firebaseAuth.signOut();
      } catch (e) {
        emit(Authfailed(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
