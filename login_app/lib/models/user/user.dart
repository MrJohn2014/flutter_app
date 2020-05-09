class User{
  num id;
  String email;
  String firstName;
  String lastName;
  String avatar;
  String updatedAt;
  String createdAt;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
    this.updatedAt,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
      updatedAt: json["updatedAt"],
      createdAt: json["createdAt"],
    );
  }
}