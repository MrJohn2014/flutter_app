import 'package:login_app/models/login/account_state.dart';
import 'package:login_app/redux/account/account_actions.dart';
import 'package:redux/redux.dart';
import 'package:login_app/models/app_state.dart';

class LoginViewModel {
  final Function(String, String, Function()) loginAccount;
  final String loginErr;
  final String token;

  LoginViewModel({
     this.loginAccount,
     this.loginErr,
     this.token,
  });

  static LoginViewModel fromStore(Store<AppState> store){
    AccountState accountState = store.state.accountState;
    return LoginViewModel(
       loginAccount: (email, pwd, callback) => store.dispatch(LoginAccountAction(email,pwd,callback)),
       loginErr: accountState.errMsg,
       token: accountState.token,
    );
  }
}