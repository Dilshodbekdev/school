/// currentPage : 1
/// countItemsOnPage : 1
/// totalPages : 1
/// count : 1
/// pageSize : 10
/// results : [{"id":95,"name":"chorak 1","created_at":"13-11-2024 13:23","ended_date":null,"state":1,"question_count":3,"count":0,"spent_time":0,"remaining_time":3499}]

class StartedSimpleTestsStudentModel {
  StartedSimpleTestsStudentModel({
    this.currentPage,
    this.countItemsOnPage,
    this.totalPages,
    this.count,
    this.pageSize,
    this.results,
  });

  StartedSimpleTestsStudentModel.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    countItemsOnPage = json['countItemsOnPage'];
    totalPages = json['totalPages'];
    count = json['count'];
    pageSize = json['pageSize'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(StartedSimpleTestModel.fromJson(v));
      });
    }
  }

  int? currentPage;
  int? countItemsOnPage;
  int? totalPages;
  int? count;
  int? pageSize;
  List<StartedSimpleTestModel>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['countItemsOnPage'] = countItemsOnPage;
    map['totalPages'] = totalPages;
    map['count'] = count;
    map['pageSize'] = pageSize;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 95
/// name : "chorak 1"
/// created_at : "13-11-2024 13:23"
/// ended_date : null
/// state : 1
/// question_count : 3
/// count : 0
/// spent_time : 0
/// remaining_time : 3499

class StartedSimpleTestModel {
  StartedSimpleTestModel({
    this.id,
    this.name,
    this.createdAt,
    this.endedDate,
    this.state,
    this.questionCount,
    this.count,
    this.spentTime,
    this.remainingTime,
  });

  StartedSimpleTestModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    endedDate = json['ended_date'];
    state = json['state'];
    questionCount = json['question_count'];
    count = json['count'];
    spentTime = json['spent_time'];
    remainingTime = json['remaining_time'];
  }

  int? id;
  String? name;
  String? createdAt;
  dynamic endedDate;
  int? state;
  int? questionCount;
  int? count;
  int? spentTime;
  int? remainingTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['created_at'] = createdAt;
    map['ended_date'] = endedDate;
    map['state'] = state;
    map['question_count'] = questionCount;
    map['count'] = count;
    map['spent_time'] = spentTime;
    map['remaining_time'] = remainingTime;
    return map;
  }
}
