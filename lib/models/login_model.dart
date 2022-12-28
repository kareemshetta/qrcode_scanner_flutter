class LoginModel {
  int status;
  String message;
  Data data;

  LoginModel({required this.data, required this.message, required this.status});

  factory LoginModel.fromJson(dynamic data) {
    final status = data['status'];
    final message = data['massage'];
    final dataa = Data.fromJson(data['data']);
    return LoginModel(data: dataa, message: message, status: status);
  }
}

class Data {
  String token;
  User user;

  Data({required this.token, required this.user});
  factory Data.fromJson(dynamic data) {
    final token = data['token'];
    final user = User.fromJson(data['user']);
    return Data(token: token, user: user);
  }
}

class User {
  int id;
  String phone;
  String name;
  String createdAt;
  String updatedAt;

  User(
      {required this.id,
      required this.phone,
      required this.createdAt,
      required this.name,
      required this.updatedAt});
  factory User.fromJson(dynamic data) {
    final id = data['id'];
    final name = data['name'];
    final phone = data['phone'];
    final createdAt = data['created_at'];
    final updatedAt = data['updated_at'];
    return User(
        id: id,
        phone: phone,
        createdAt: createdAt,
        name: name,
        updatedAt: updatedAt);
  }
}
