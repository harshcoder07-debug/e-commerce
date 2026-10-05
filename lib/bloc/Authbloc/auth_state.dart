import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class Authinitial extends AuthState {}

class Authloading extends AuthState {}

class LoginState extends AuthState {}

class SignupState extends AuthState {}

class Authsucess extends AuthState {
  final User user;

  Authsucess(this.user);
}

class Authfailed extends AuthState {
  final String erromessage;

  Authfailed(this.erromessage);
}

class Authlogout extends AuthState {}

class registerloading extends AuthState {}

class registersuccess extends AuthState {
  final User user;

  registersuccess(this.user);
}

class registerfailed extends AuthState {
  final String message;

  registerfailed(this.message);
}