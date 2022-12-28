class User {
  final String id;
  final String fullname;
  final String email;
  final String userRole;

  User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.userRole,
  });

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullname = data['fullname'],
        email = data['email'],
        userRole = data['userRole'];

  Map<String, dynamic> toJoson() {
    return {
      "id":id,
      "fullname":fullname,
      "email":email,
      "userRole":userRole,
    };
  }
}
