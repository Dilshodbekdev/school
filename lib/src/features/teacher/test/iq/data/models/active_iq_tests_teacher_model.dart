/// currentPage : 1
/// countItemsOnPage : 3
/// totalPages : 1
/// count : 3
/// pageSize : 10
/// results : [{"id":2,"name":"iq","test_time":"07:07:00","started_date":"26-11-2024 12:00","ended_date":"30-11-2024 12:00","status":1,"number_of_questions":2123,"classes":[{"id":13,"letter":"A","number":2}]},{"id":3,"name":"iq 1","test_time":"07:07:00","started_date":"30-11-2024 12:00","ended_date":"30-11-2024 12:00","status":1,"number_of_questions":12,"classes":[{"id":13,"letter":"A","number":2}]},{"id":4,"name":"iq3","test_time":"06:06:00","started_date":"29-11-2024 12:00","ended_date":"30-11-2024 12:00","status":1,"number_of_questions":23,"classes":[{"id":13,"letter":"A","number":2}]}]

class ActiveIqTestsTeacherModel {
  ActiveIqTestsTeacherModel({
    this.currentPage,
    this.countItemsOnPage,
    this.totalPages,
    this.count,
    this.pageSize,
    this.results,
  });

  ActiveIqTestsTeacherModel.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    countItemsOnPage = json['countItemsOnPage'];
    totalPages = json['totalPages'];
    count = json['count'];
    pageSize = json['pageSize'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ActiveIqTestTeacher.fromJson(v));
      });
    }
  }

  int? currentPage;
  int? countItemsOnPage;
  int? totalPages;
  int? count;
  int? pageSize;
  List<ActiveIqTestTeacher>? results;

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

/// id : 2
/// name : "iq"
/// test_time : "07:07:00"
/// started_date : "26-11-2024 12:00"
/// ended_date : "30-11-2024 12:00"
/// status : 1
/// number_of_questions : 2123
/// classes : [{"id":13,"letter":"A","number":2}]

class ActiveIqTestTeacher {
  ActiveIqTestTeacher({
    this.id,
    this.name,
    this.testTime,
    this.startedDate,
    this.endedDate,
    this.status,
    this.numberOfQuestions,
    this.classes,
  });

  ActiveIqTestTeacher.fromJson(dynamic json) {
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
  String? testTime;
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

  Classes copyWith({
    int? id,
    String? letter,
    int? number,
  }) =>
      Classes(
        id: id ?? this.id,
        letter: letter ?? this.letter,
        number: number ?? this.number,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['letter'] = letter;
    map['number'] = number;
    return map;
  }
}
