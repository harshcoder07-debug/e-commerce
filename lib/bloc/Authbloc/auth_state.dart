import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {
  final bool isLogin;

  AuthState({this.isLogin = true});
}

//login state
class LoginState extends AuthState {
  @override
  bool get isLogin => true;
}

//sign up state
class SignupState extends AuthState {
  @override
  bool get isLogin => false;
}

//Authinitial
class Authinitial extends AuthState {}

//Authloading
class Authloading extends AuthState {}

//Authsucess
class Authsucess extends AuthState {
  Authsucess(User user);
}

//failed Auth
class Authfailed extends AuthState {
  final String erromessage;

  Authfailed(this.erromessage);
}

class Authlogout extends AuthState {
  @override
  bool get islogin => true;
}
