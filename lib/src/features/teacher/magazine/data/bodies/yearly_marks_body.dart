/// mark : 2
/// student : 411
/// record : 25
/// quarter : 8

class YearlyMarksBody {
  YearlyMarksBody({
    this.mark,
    this.student,
    this.record,
  });

  int? mark;
  int? student;
  int? record;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mark'] = mark;
    map['student'] = student;
    map['record'] = record;
    return map;
  }
}
