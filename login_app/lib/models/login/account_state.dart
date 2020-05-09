import 'package:login_app/models/login/account.dart';

//define accountstate class which represents all states of account
class AccountState {
  final Account account;
  final String errMsg;
  final String token;
  final String email;

  const AccountState({
     this.account,
     this.errMsg,
     this.token,
     this.email,
  });

  AccountState copyWith({
    String token,
    String errMsg,
    Account account,
    String email,
  }){
    return new AccountState(
      token: token ?? this.token,
      errMsg: errMsg ?? this.errMsg,
      account: account ?? this.account,
      email: email ?? this.email,
    );
  }

  factory AccountState.initial(){
    return new AccountState(
      errMsg: "",
      email: "",
    );
  }

}