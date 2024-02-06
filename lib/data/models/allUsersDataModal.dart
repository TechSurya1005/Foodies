class AllUsersDataModal {
  User? user;

  AllUsersDataModal({this.user});

  AllUsersDataModal.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? fullName;
  String? email;
  String? mobileNumber;
  String? dob;
  String? gender;
  String? created;
  bool? active;
  String? otp;
  int? iV;
  String? token;

  User(
      {this.sId,
      this.fullName,
      this.email,
      this.mobileNumber,
      this.dob,
      this.gender,
      this.created,
      this.active,
      this.otp,
      this.iV,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    dob = json['dob'];
    gender = json['gender'];
    created = json['created'];
    active = json['active'];
    otp = json['otp'];
    iV = json['__v'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['created'] = this.created;
    data['active'] = this.active;
    data['otp'] = this.otp;
    data['__v'] = this.iV;
    data['token'] = this.token;
    return data;
  }
}
