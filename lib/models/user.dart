class User {
  int? id;
  late final String email;
  late final String password;
  late final String city;
  late final String state;

  User(
      {this.id,
      required this.email,
      required this.password,
      required this.city,
      required this.state});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['city'] = city;
    data['state'] = state;
    return data;
  }
}
