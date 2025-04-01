/// id : 347
/// first_name : "new student"
/// last_name : "new student"
/// mid_name : "new student"
/// mark : 4
/// ava_mark : 3.0
/// nb_count : 1

class QuarterlyMarksTeacherModel {
  QuarterlyMarksTeacherModel({
    this.id,
    this.firstName,
    this.lastName,
    this.midName,
    this.mark,
    this.avaMark,
    this.nbCount,
  });

  QuarterlyMarksTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    midName = json['mid_name'];
    mark = json['mark'];
    avaMark = json['ava_mark'];
    nbCount = json['nb_count'];
  }

  int? id;
  String? firstName;
  String? lastName;
  String? midName;
  int? mark;
  double? avaMark;
  int? nbCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['mid_name'] = midName;
    map['mark'] = mark;
    map['ava_mark'] = avaMark;
    map['nb_count'] = nbCount;
    return map;
  }
}
