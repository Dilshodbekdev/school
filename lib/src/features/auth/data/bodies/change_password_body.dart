/// temp_password : "string"
/// password : "string"

class ChangePasswordBody {
  ChangePasswordBody({
    this.tempPassword,
    this.password,
    this.id,
  });

  ChangePasswordBody.fromJson(dynamic json) {
    tempPassword = json['temp_password'];
    password = json['password'];
  }

  String? tempPassword;
  String? password;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp_password'] = tempPassword;
    map['password'] = password;
    return map;
  }
}
