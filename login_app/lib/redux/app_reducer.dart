import 'package:login_app/models/app_state.dart';
import 'package:login_app/redux/account/account_reducer.dart';
import 'package:login_app/redux/user/user_reducer.dart';

AppState appStateReducer(AppState state, dynamic action) =>
  new AppState(
      accountState: accountReducer(state.accountState,action),
      usersState: userReducer(state.usersState,action),
  );
