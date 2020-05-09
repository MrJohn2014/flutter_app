import 'package:login_app/models/user/user.dart';

class UserList{
  num page;
  num per_page;
  num total;
  num total_pages;
  List<User> data;

  UserList({
    this.page,
    this.per_page,
    this.total,
    this.total_pages,
    this.data,
  });

  factory UserList.fromJson(Map<String, dynamic> json) {
    List<User> users = [];
    List<dynamic> userDataList = json["data"];
    for(var i=0; i < userDataList.length; i++){
      User user = User.fromJson(userDataList[i]);
      users.add(user);
    }
    return UserList(
      page: json["page"],
      per_page: json["per_page"],
      total: json["total"],
      total_pages: json["total_pages"],
      data: users,
    );
  }
}