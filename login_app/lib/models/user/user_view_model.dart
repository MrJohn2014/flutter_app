import 'package:login_app/models/app_state.dart';
import 'package:login_app/models/login/account_state.dart';
import 'package:login_app/models/user/user.dart';
import 'package:login_app/models/user/users_state.dart';
import 'package:login_app/redux/user/user_actions.dart';
import 'package:redux/redux.dart';

class UserViewModel {

  final String email;
  final User singleUser;
  final User searchUser;
  final User updateUser;
  final List<User> users;
  final Function(Function()) getAllUsers;
  final Function(Function(),num) searchUserByID;
  final Function(User) prepareUpdateUser;
  final Function(String, String, String,num) updateUserInfo;
  final Function(User) deleteUser;
  final User updatedUser;
  final num  deleteResult;
  final Function(String, String, String) createUser;
  final User createdUser; //save created user data

  UserViewModel({
    this.email,
    this.singleUser,
    this.searchUser,
    this.updateUser,
    this.users,
    this.getAllUsers,
    this.searchUserByID,
    this.prepareUpdateUser,
    this.updateUserInfo,
    this.deleteUser,
    this.updatedUser,
    this.deleteResult,
    this.createUser,
    this.createdUser,
  });

  static UserViewModel fromStore(Store<AppState> store){
    UsersState  usersState = store.state.usersState;
    AccountState accState = store.state.accountState;
    return UserViewModel(
      email: accState.email,
      getAllUsers: (callback) => store.dispatch(FetchAllUsersAction(callback)),
      users: usersState.users,
      searchUserByID: (callback,id) => store.dispatch(SearchUserByIDAction(callback,id)),
      searchUser: usersState.searchUser,
      prepareUpdateUser: (user) => store.dispatch(PrepareUpdateUserAction(user)),
      updateUser: usersState.updateUser,
      updateUserInfo: (email, firstname, lastname,id) => store.dispatch(UpdateUserInfoAction(email,firstname,lastname,id)),
      deleteUser: (user) => store.dispatch(DeleteUserAction(user)),
      updatedUser: usersState.updatedUser,
      deleteResult: usersState.deleteUserResult,
      createUser: (email, firstname, lastname) => store.dispatch(CreateUserAction(email, firstname, lastname)),
      createdUser: usersState.createdUser,
    );
  }
}