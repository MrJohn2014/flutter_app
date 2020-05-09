//define account class, which is account model
class Account{
  num id;
  String firstName;
  String lastName;
  String email;
  String pwd;
  String avatar;

  Account({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.pwd,
    this.avatar
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}