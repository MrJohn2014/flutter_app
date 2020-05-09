import 'package:login_app/redux/account/account_actions.dart';
import 'package:redux/redux.dart';
import 'package:login_app/models/login/account_state.dart';

final accountReducer = combineReducers<AccountState>([
   TypedReducer<AccountState, StoreLoginTokenAction> (_storeLoginToken),
   TypedReducer<AccountState, UpdateLoginErrorAction>(_updateLoginErr),
   TypedReducer<AccountState, StoreAccountEmailAction>(_storeAccountEmail),
]);

AccountState _storeLoginToken(AccountState state, StoreLoginTokenAction action){
  return state.copyWith(token: action.token);
}

AccountState _storeAccountEmail(AccountState state, StoreAccountEmailAction action){
  return state.copyWith(email: action.email);
}

AccountState _updateLoginErr(AccountState state, UpdateLoginErrorAction action) =>
   state.copyWith(errMsg: action.loginErr);


