/// lesson_date : 1338
/// mark : 2
/// student : 411
/// record : 25

class SelectRatingBody {
  SelectRatingBody({
    this.lessonDate,
    this.mark,
    this.student,
    this.record,
  });

  SelectRatingBody.fromJson(dynamic json) {
    lessonDate = json['lesson_date'];
    mark = json['mark'];
    student = json['student'];
    record = json['record'];
  }

  int? lessonDate;
  int? mark;
  int? student;
  int? record;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lesson_date'] = lessonDate;
    map['mark'] = mark;
    map['student'] = student;
    map['record'] = record;
    return map;
  }
}
