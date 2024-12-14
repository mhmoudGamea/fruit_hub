class UserEntity {
  final String email;
  final String? name;
  final String uid;

  UserEntity({required this.email, required this.name, required this.uid});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }
}
