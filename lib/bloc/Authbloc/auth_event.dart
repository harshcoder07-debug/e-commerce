import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent {}

class ShowLogin extends AuthEvent {}

class ShowSignup extends AuthEvent {}

class loginrequest extends AuthEvent {
  final String loginemail;
  final String loginpassword;

  loginrequest(this.loginemail, this.loginpassword);
}

class Signuprequest extends AuthEvent {
  final String Signupemail;
  final String signuppassword;

  Signuprequest(this.Signupemail, this.signuppassword);
}

class Authuserchnged extends AuthEvent {
  final User user;

  Authuserchnged(this.user);
}

class AuthUserUnauthenticated extends AuthEvent {}

class AuthUserLogoutChanged extends AuthEvent {}

class Acccreaterequest extends AuthEvent {
  final String signupmail;
  final String Password;

  Acccreaterequest(this.signupmail, this.Password);
}