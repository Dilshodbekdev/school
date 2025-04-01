/// currentPage : 1
/// countItemsOnPage : 2
/// totalPages : 1
/// count : 2
/// pageSize : 10
/// results : [{"id":43,"name":"asdfasdfsdfas","test_time":"12:06:00","started_date":"05-11-2024 12:00","ended_date":"28-11-2024 12:00","status":1,"number_of_questions":12,"classes":[{"id":13,"letter":"A","number":2},{"id":20,"letter":"G","number":2}]},{"id":47,"name":"chorak 1","test_time":"01:00:00","started_date":"12-11-2024 12:00","ended_date":"14-11-2024 12:00","status":1,"number_of_questions":3,"classes":[{"id":13,"letter":"A","number":2}]}]

class NewSimpleTestsStudentModel {
  NewSimpleTestsStudentModel({
    this.currentPage,
    this.countItemsOnPage,
    this.totalPages,
    this.count,
    this.pageSize,
    this.results,
  });

  NewSimpleTestsStudentModel.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    countItemsOnPage = json['countItemsOnPage'];
    totalPages = json['totalPages'];
    count = json['count'];
    pageSize = json['pageSize'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(NewSimpleTestModel.fromJson(v));
      });
    }
  }

  int? currentPage;
  int? countItemsOnPage;
  int? totalPages;
  int? count;
  int? pageSize;
  List<NewSimpleTestModel>? results;

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

/// id : 43
/// name : "asdfasdfsdfas"
/// test_time : "12:06:00"
/// started_date : "05-11-2024 12:00"
/// ended_date : "28-11-2024 12:00"
/// status : 1
/// number_of_questions : 12
/// classes : [{"id":13,"letter":"A","number":2},{"id":20,"letter":"G","number":2}]

class NewSimpleTestModel {
  NewSimpleTestModel({
    this.id,
    this.name,
    this.testTime,
    this.startedDate,
    this.endedDate,
    this.status,
    this.numberOfQuestions,
    this.classes,
  });

  NewSimpleTestModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    testTime = json['test_time'];
    startedDate = json['started_date'];
    endedDate = json['ended_date'];
    status = json['status'];
    numberOfQuestions = json['number_of_questions'];
    if (json['classes'] != null) {
      classes = [];
      json['classes'].forEach((v) {
        classes?.add(Classes.fromJson(v));
      });
    }
  }

  int? id;
  String? name;
  num? testTime;
  String? startedDate;
  String? endedDate;
  int? status;
  int? numberOfQuestions;
  List<Classes>? classes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['test_time'] = testTime;
    map['started_date'] = startedDate;
    map['ended_date'] = endedDate;
    map['status'] = status;
    map['number_of_questions'] = numberOfQuestions;
    if (classes != null) {
      map['classes'] = classes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 13
/// letter : "A"
/// number : 2

class Classes {
  Classes({
    this.id,
    this.letter,
    this.number,
  });

  Classes.fromJson(dynamic json) {
    id = json['id'];
    letter = json['letter'];
    number = json['number'];
  }

  int? id;
  String? letter;
  int? number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['letter'] = letter;
    map['number'] = number;
    return map;
  }
}
