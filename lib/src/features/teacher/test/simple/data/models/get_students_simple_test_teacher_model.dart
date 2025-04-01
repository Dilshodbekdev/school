/// id : 349
/// first_name : "Абдуссамихон"
/// last_name : "Абдукаюмов"
/// mid_name : "Абдуфоихович"
/// enroll_result : {"id":100,"created_at":"15-11-2024 10:35","ended_date":"15-11-2024 10:36","state":2,"count":1,"spent_time":87,"remaining_time":0}

class GetStudentsSimpleTestTeacherModel {
  GetStudentsSimpleTestTeacherModel({
    this.id,
    this.firstName,
    this.lastName,
    this.midName,
    this.enrollResult,
  });

  GetStudentsSimpleTestTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    midName = json['mid_name'];
    enrollResult = json['enroll_result'] != null
        ? EnrollResult.fromJson(json['enroll_result'])
        : null;
  }

  int? id;
  String? firstName;
  String? lastName;
  String? midName;
  EnrollResult? enrollResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['mid_name'] = midName;
    if (enrollResult != null) {
      map['enroll_result'] = enrollResult?.toJson();
    }
    return map;
  }
}

/// id : 100
/// created_at : "15-11-2024 10:35"
/// ended_date : "15-11-2024 10:36"
/// state : 2
/// count : 1
/// spent_time : 87
/// remaining_time : 0

class EnrollResult {
  EnrollResult({
    this.id,
    this.createdAt,
    this.endedDate,
    this.state,
    this.count,
    this.spentTime,
    this.remainingTime,
  });

  EnrollResult.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    endedDate = json['ended_date'];
    state = json['state'];
    count = json['count'];
    spentTime = json['spent_time'];
    remainingTime = json['remaining_time'];
  }

  int? id;
  String? createdAt;
  String? endedDate;
  int? state;
  int? count;
  int? spentTime;
  int? remainingTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['ended_date'] = endedDate;
    map['state'] = state;
    map['count'] = count;
    map['spent_time'] = spentTime;
    map['remaining_time'] = remainingTime;
    return map;
  }
}
