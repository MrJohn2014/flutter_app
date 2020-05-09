import 'package:login_app/models/user/user.dart';

class UsersState {
  final List<User> users;
  final User searchUser;
  final User updateUser;
  final User singleUser;
  final User updatedUser; //update result
  final num deleteUserResult; //delete user result
  final User createdUser;

  const UsersState({
    this.users,
    this.searchUser,
    this.updateUser,
    this.singleUser,
    this.updatedUser,
    this.deleteUserResult,
    this.createdUser,
  });

  UsersState copyWith({
    List<User> users,
    User searchUser,
    User updateUser,
    User singleUser,
    User updatedUser,
    num  deleteUserResult,
    User createdUser,
  }){
    return new UsersState(
      users: users ?? this.users,
      searchUser: searchUser ?? this.searchUser,
      updateUser: updateUser ?? this.updateUser,
      singleUser: singleUser ?? this.singleUser,
      updatedUser: updatedUser ?? this.updatedUser,
      deleteUserResult: deleteUserResult ?? this.deleteUserResult,
      createdUser: createdUser ?? this.createdUser,
    );
  }

  factory UsersState.initial(){
    return new UsersState(

    );
  }
}