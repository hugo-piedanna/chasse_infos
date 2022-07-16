class userModel {
  String? uid;
  String? name;
  String? lastName;
  String? email;
  String? birthday;

  userModel({this.uid, this.name, this.lastName, this.email, this.birthday});

  factory userModel.fromMap(map) {
    return userModel(
        uid: map['uid'],
        name: map['name'],
        lastName: map['lastName'],
        email: map['email'],
        birthday: map['birthday']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'lastName': lastName,
      'email': email,
      'birthday': birthday,
    };
  }
}
