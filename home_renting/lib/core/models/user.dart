class UserModel {
  final String id;
  final String fullname;
  final String email;
  final String userRole;
  final String phoneNumber;

  UserModel({
    required this.id,
    required this.fullname,
    required this.email,
    required this.userRole,
    required this.phoneNumber,
  });

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullname = data['fullname'],
        email = data['email'],
        userRole = data['userRole'],
        phoneNumber = data["phoneNumber"];

  Map<String, dynamic> toJoson() {
    return {
      "id": id,
      "fullname": fullname,
      "email": email,
      "userRole": userRole,
      "phoneNumber":phoneNumber,
    };
  }
}
