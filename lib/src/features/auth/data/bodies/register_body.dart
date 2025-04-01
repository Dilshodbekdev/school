/// firstName : "string"
/// lastName : "string"
/// phoneNumber : "string"
/// password : "string"

class RegisterBody {
  RegisterBody({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.password,
  });

  RegisterBody.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    return map;
  }
}
