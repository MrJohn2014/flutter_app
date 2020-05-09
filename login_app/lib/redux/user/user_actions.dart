import 'package:login_app/models/user/user.dart';

class FetchAllUsersAction{
  Function() onSuccess;
  FetchAllUsersAction(this.onSuccess);
}

class StoreListUsersAction{
  final List<User> users;
  StoreListUsersAction(this.users);
}

class SearchUserByIDAction{
  Function() onSuccess;
  final num id;
  SearchUserByIDAction(this.onSuccess,this.id);
}

class StoreSearchUserAction{
  final User searchUser;
  StoreSearchUserAction(this.searchUser);
}

class PrepareUpdateUserAction{
  final User updateUser;
  PrepareUpdateUserAction(this.updateUser);
}

class UpdateUserInfoAction{
  final String email;
  final String firstname;
  final String lastname;
  final num id;
  UpdateUserInfoAction(this.email, this.firstname, this.lastname,this.id);
}

class StoreUpdatedUserAction{
  final User updatedUser;
  StoreUpdatedUserAction(this.updatedUser);
}

class DeleteUserAction{
  final User deleteUser;
  DeleteUserAction(this.deleteUser);
}

class StoreDeleteUserResultAction{
  final num statusCode;
  StoreDeleteUserResultAction(this.statusCode);
}

class CreateUserAction{
  final String email;
  final String firstname;
  final String lastname;
  CreateUserAction(this.email, this.firstname, this.lastname);
}

class StoreCreatedUserAction{
  final User user;
  StoreCreatedUserAction(this.user);
}