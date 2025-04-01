/// weekday : 0
/// date : "2024-11-04T15:24:59.358555"
/// lessons : [{"sequence":1,"subjects":["Tasviriy san’at","Algebra"],"mark":4},{"sequence":2,"subjects":["Musiqa"],"mark":null},{"sequence":3,"subjects":["Informatika"],"mark":5},{"sequence":4,"subjects":["Informatika"],"mark":5},{"sequence":5,"subjects":["Algebra"],"mark":3},{"sequence":6,"subjects":null,"mark":null},{"sequence":7,"subjects":null,"mark":null},{"sequence":8,"subjects":null,"mark":null},{"sequence":9,"subjects":null,"mark":null},{"sequence":10,"subjects":null,"mark":null}]

class DiaryStudentModel {
  DiaryStudentModel({
    this.weekday,
    this.date,
    this.lessons,
  });

  DiaryStudentModel.fromJson(dynamic json) {
    weekday = json['weekday'];
    date = json['date'];
    if (json['lessons'] != null) {
      lessons = [];
      json['lessons'].forEach((v) {
        lessons?.add(LessonModel.fromJson(v));
      });
    }
  }

  int? weekday;
  String? date;
  List<LessonModel>? lessons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['weekday'] = weekday;
    map['date'] = date;
    if (lessons != null) {
      map['lessons'] = lessons?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// sequence : 1
/// subjects : ["Tasviriy san’at","Algebra"]
/// mark : 4

class LessonModel {
  LessonModel({
    this.sequence,
    this.subjects,
    this.mark,
  });

  LessonModel.fromJson(dynamic json) {
    sequence = json['sequence'];
    subjects = json['subjects'] != null ? json['subjects'].cast<String>() : [];
    mark = json['mark'];
  }

  int? sequence;
  List<String>? subjects;
  int? mark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sequence'] = sequence;
    map['subjects'] = subjects;
    map['mark'] = mark;
    return map;
  }
}
