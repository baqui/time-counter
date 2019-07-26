class User {
  String id;
  String name;
  String login;
  String avatar;
  User({this.id, this.name, this.login, this.avatar });

  User.initial()
      : id = '',
        name = '',
        login = '',
        avatar = '';

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    login = json['login'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['login'] = this.login;
    data['avatar'] = this.avatar;
    return data;
  }
}
