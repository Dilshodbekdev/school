/// id : 31
/// subject__name : "Алгебра"

class ClassRecordTeacherModel {
  ClassRecordTeacherModel({
    this.id,
    this.subjectName,
  });

  ClassRecordTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    subjectName = json['subject__name'];
  }

  int? id;
  String? subjectName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subject__name'] = subjectName;
    return map;
  }
}
