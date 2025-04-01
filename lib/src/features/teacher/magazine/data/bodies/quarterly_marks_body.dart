/// mark : 2
/// student : 411
/// record : 25
/// quarter : 8

class QuarterlyMarksBody {
  QuarterlyMarksBody({
    this.mark,
    this.student,
    this.record,
    this.quarter,
  });

  QuarterlyMarksBody.fromJson(dynamic json) {
    mark = json['mark'];
    student = json['student'];
    record = json['record'];
    quarter = json['quarter'];
  }

  int? mark;
  int? student;
  int? record;
  int? quarter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mark'] = mark;
    map['student'] = student;
    map['record'] = record;
    map['quarter'] = quarter;
    return map;
  }
}
