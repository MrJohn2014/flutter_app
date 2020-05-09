import 'package:login_app/models/login/account.dart';

class LoginAccountAction{
  final String email;
  final String pwd;
  Function() onSuccess;
  LoginAccountAction(this.email,this.pwd,this.onSuccess);
}

class UpdateLoginErrorAction{
  final String loginErr;
  UpdateLoginErrorAction(this.loginErr);
}

class StoreLoginTokenAction{
  final String token;
  StoreLoginTokenAction(this.token);
}

class StoreAccountEmailAction{
  final String email;
  StoreAccountEmailAction(this.email);
}