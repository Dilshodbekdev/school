/// phoneNumber : "string"

class SendSmsBody {
  SendSmsBody({
    this.phoneNumber,
  });

  SendSmsBody.fromJson(dynamic json) {
    phoneNumber = json['phoneNumber'];
  }

  String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    return map;
  }
}
