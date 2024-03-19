import 'dart:convert';

class AuthResponseModel {
    final int code;
    final bool success;
    final String message;
    final Data data;

    AuthResponseModel({
        required this.code,
        required this.success,
        required this.message,
        required this.data,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data.toMap(),
    };
}

class Data {
    final String accessToken;
    final User user;

    Data({
        required this.accessToken,
        required this.user,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        user: User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "user": user.toMap(),
    };
}

class User {
    final int id;
    final String name;
    final String email;
    final String roles;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.roles,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": roles,
    };
}
