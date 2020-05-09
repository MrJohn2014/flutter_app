import 'package:login_app/models/user/users_state.dart';
import 'package:login_app/redux/user/user_actions.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<UsersState>([
  TypedReducer<UsersState, StoreListUsersAction>(_storeListUsers),
  TypedReducer<UsersState, StoreSearchUserAction>(_storeSearchUser),
  TypedReducer<UsersState, PrepareUpdateUserAction>(_prepareUpdateUser),
  TypedReducer<UsersState, StoreUpdatedUserAction>(_storeUpdatedUser),
  TypedReducer<UsersState, StoreDeleteUserResultAction>(_storeDeleteUserResult),
  TypedReducer<UsersState, StoreCreatedUserAction>(_storeCreatedUser),
]);


UsersState _storeListUsers(UsersState state, StoreListUsersAction action){
  return state.copyWith(users: action.users);
}

UsersState _storeSearchUser(UsersState state, StoreSearchUserAction action){
  return state.copyWith(searchUser: action.searchUser);
}

UsersState _prepareUpdateUser(UsersState state, PrepareUpdateUserAction action){
  return state.copyWith(updateUser: action.updateUser);
}

UsersState _storeUpdatedUser(UsersState state, StoreUpdatedUserAction action){
  return state.copyWith(updatedUser: action.updatedUser);
}

UsersState _storeDeleteUserResult(UsersState state, StoreDeleteUserResultAction action){
  return state.copyWith(deleteUserResult: action.statusCode);
}

UsersState _storeCreatedUser(UsersState state, StoreCreatedUserAction action){
  return state.copyWith(createdUser: action.user);
}