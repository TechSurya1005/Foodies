
import 'dart:convert';

LoginRespose loginResposeFromJson(String str) => LoginRespose.fromJson(json.decode(str));

String loginResposeToJson(LoginRespose data) => json.encode(data.toJson());

class LoginRespose {
    LoginRespose({
        required this.success,
        required this.message,
        required this.user,
    });

    bool success;
    String message;
    User user;

    factory LoginRespose.fromJson(Map<dynamic, dynamic> json) => LoginRespose(
        success: json["success"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    User({
        required this.gender,
        required this.mobileNumber,
        required this.dob,
        required this.created,
        required this.v,
        required this.fullName,
        required this.active,
        required this.otp,
        required this.id,
        required this.email,
        required this.token,
    });

    String gender;
    String mobileNumber;
    String dob;
    DateTime created;
    int v;
    String fullName;
    bool active;
    String otp;
    String id;
    String email;
    String token;

    factory User.fromJson(Map<dynamic, dynamic> json) => User(
        gender: json["gender"],
        mobileNumber: json["mobileNumber"],
        dob: json["dob"],
        created: DateTime.parse(json["created"]),
        v: json["__v"],
        fullName: json["fullName"],
        active: json["active"],
        otp: json["otp"],
        id: json["_id"],
        email: json["email"],
        token: json["token"],
    );

    Map<dynamic, dynamic> toJson() => {
        "gender": gender,
        "mobileNumber": mobileNumber,
        "dob": dob,
        "created": created.toIso8601String(),
        "__v": v,
        "fullName": fullName,
        "active": active,
        "otp": otp,
        "_id": id,
        "email": email,
        "token": token,
    };
}
