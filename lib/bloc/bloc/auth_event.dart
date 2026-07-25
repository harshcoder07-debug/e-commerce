abstract class AuthEvent {}

class ShowLogin extends AuthEvent {}

class ShowSignup extends AuthEvent {}

//loginreq
class loginrequest extends AuthEvent {
  final String loginemail;
  final String loginpassword;

  loginrequest(this.loginemail, this.loginpassword);
}

//signuprequest
class Signuprequest {
  final String Signupemail;
  final String signuppassword;

  Signuprequest(this.Signupemail, this.signuppassword);
  
}
