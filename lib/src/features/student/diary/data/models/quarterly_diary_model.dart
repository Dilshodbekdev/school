/// id : 30
/// subject_name : "Robototexnika"
/// mark : null

class QuarterlyDiaryModel {
  QuarterlyDiaryModel({
    this.id,
    this.subjectName,
    this.mark,
  });

  QuarterlyDiaryModel.fromJson(dynamic json) {
    id = json['id'];
    subjectName = json['subject_name'];
    mark = json['mark'];
  }

  int? id;
  String? subjectName;
  dynamic mark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subject_name'] = subjectName;
    map['mark'] = mark;
    return map;
  }
}
