class User {
  final int id;
  final String name;
  final String email;
  final String password;
  const User({required this.name, required this.email, required this.password, required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'], 
      name: json['username'], 
      email: json['email'], 
      password: json['password']
    );
  }
}