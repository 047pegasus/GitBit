class UserData {
  int id;
  String username;
  String userInformation;

  UserData(
      {required this.id,
      required this.username,
      required this.userInformation});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'userInformation': userInformation,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'],
      username: map['username'],
      userInformation: map['userInformation'],
    );
  }
}
