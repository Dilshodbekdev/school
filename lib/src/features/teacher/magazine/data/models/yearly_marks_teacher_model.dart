/// id : 347
/// first_name : "new student"
/// last_name : "new student"
/// mid_name : "new student"
/// mark : null

class YearlyMarksTeacherModel {
  YearlyMarksTeacherModel({
    this.id,
    this.firstName,
    this.lastName,
    this.midName,
    this.mark,
  });

  YearlyMarksTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    midName = json['mid_name'];
    mark = json['mark'];
  }

  int? id;
  String? firstName;
  String? lastName;
  String? midName;
  int? mark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['mid_name'] = midName;
    map['mark'] = mark;
    return map;
  }
}
