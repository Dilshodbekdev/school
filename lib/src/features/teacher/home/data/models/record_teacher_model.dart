/// mark_stat : {"0":0,"2":0,"3":1,"4":12,"5":0}
/// nb_stat : [{"mark":6,"count":29},{"mark":7,"count":15}]
/// attendance_percentage : 87.46438746438746

class RecordTeacherModel {
  RecordTeacherModel({
    this.markStat,
    this.nbStat,
    this.attendancePercentage,
  });

  RecordTeacherModel.fromJson(dynamic json) {
    markStat =
        json['mark_stat'] != null ? MarkStat.fromJson(json['mark_stat']) : null;
    if (json['nb_stat'] != null) {
      nbStat = [];
      json['nb_stat'].forEach((v) {
        nbStat?.add(NbStat.fromJson(v));
      });
    }
    attendancePercentage = json['attendance_percentage'];
  }

  MarkStat? markStat;
  List<NbStat>? nbStat;
  num? attendancePercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (markStat != null) {
      map['mark_stat'] = markStat?.toJson();
    }
    if (nbStat != null) {
      map['nb_stat'] = nbStat?.map((v) => v.toJson()).toList();
    }
    map['attendance_percentage'] = attendancePercentage;
    return map;
  }
}

/// mark : 6
/// count : 29

class NbStat {
  NbStat({
    this.mark,
    this.count,
  });

  NbStat.fromJson(dynamic json) {
    mark = json['mark'];
    count = json['count'];
  }

  int? mark;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mark'] = mark;
    map['count'] = count;
    return map;
  }
}

/// 0 : 0
/// 2 : 0
/// 3 : 1
/// 4 : 12
/// 5 : 0

class MarkStat {
  MarkStat({
    this.zero,
    this.two,
    this.three,
    this.four,
    this.five,
  });

  MarkStat.fromJson(dynamic json) {
    zero = json['0'];
    two = json['2'];
    three = json['3'];
    four = json['4'];
    five = json['5'];
  }

  int? zero;
  int? two;
  int? three;
  int? four;
  int? five;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['0'] = zero;
    map['2'] = two;
    map['3'] = three;
    map['4'] = four;
    map['5'] = five;
    return map;
  }
}
