/// id : 422
/// number : 1
/// date : "2024-09-27"
/// title : ""
/// homework : ""

class PlanTeacherModel {
  PlanTeacherModel({
    this.id,
    this.number,
    this.date,
    this.title,
    this.homework,
  });

  PlanTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    number = json['number'];
    date = json['date'];
    title = json['title'];
    homework = json['homework'];
  }

  int? id;
  int? number;
  String? date;
  String? title;
  String? homework;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['number'] = number;
    map['date'] = date;
    map['title'] = title;
    map['homework'] = homework;
    return map;
  }
}
