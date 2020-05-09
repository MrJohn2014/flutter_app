import 'package:flutter/cupertino.dart';
import 'package:login_app/models/login/account_state.dart';
import 'package:login_app/models/user/users_state.dart';

class AppState {
  final AccountState accountState;
  final UsersState usersState;

  const AppState({
     @required this.accountState,
     @required this.usersState,
  });

  factory AppState.initial(){
    return AppState(
      accountState: AccountState.initial(),
      usersState: UsersState.initial(),
    );
  }

  AppState copyWith({
     AccountState accountState,
     UsersState usersState,
  }){
    return AppState(
      accountState: accountState ?? this.accountState,
      usersState: usersState ?? this.usersState,
    );
  }

}