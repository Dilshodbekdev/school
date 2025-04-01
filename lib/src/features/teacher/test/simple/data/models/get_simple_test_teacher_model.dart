/// id : 43
/// name : "asdfasdfsdfas"
/// test_time : "12:06:00"
/// started_date : "05-11-2024 12:00"
/// ended_date : "28-11-2024 12:00"
/// status : 1
/// number_of_questions : 12
/// description : "fasdfasdfdsafs"
/// classes : [{"id":13,"letter":"A","number":2},{"id":20,"letter":"G","number":2}]
/// questions : [{"id":91,"title":"<p>fsadfsdfasdf</p>","answers":[{"id":292,"title":"sadfasdfdasfsadf","is_correct":false},{"id":293,"title":"fadsfsdafasfdsaf","is_correct":true},{"id":294,"title":"asdfasfsdfsadfasdfasdf","is_correct":false}]},{"id":92,"title":"<p>fasdfasfsadfsadfsadf</p>","answers":[{"id":295,"title":"fsadfasfasf","is_correct":true},{"id":296,"title":"fasdfdasfasdf","is_correct":false},{"id":297,"title":"afdfasdfsadfasdf","is_correct":false}]}]

class GetSimpleTestTeacherModel {
  GetSimpleTestTeacherModel({
    this.id,
    this.name,
    this.testTime,
    this.startedDate,
    this.endedDate,
    this.status,
    this.numberOfQuestions,
    this.description,
    this.classes,
    this.questions,
  });

  GetSimpleTestTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    testTime = json['test_time'];
    startedDate = json['started_date'];
    endedDate = json['ended_date'];
    status = json['status'];
    numberOfQuestions = json['number_of_questions'];
    description = json['description'];
    if (json['classes'] != null) {
      classes = [];
      json['classes'].forEach((v) {
        classes?.add(Classes.fromJson(v));
      });
    }
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
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
  String? description;
  List<Classes>? classes;
  List<Questions>? questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['test_time'] = testTime;
    map['started_date'] = startedDate;
    map['ended_date'] = endedDate;
    map['status'] = status;
    map['number_of_questions'] = numberOfQuestions;
    map['description'] = description;
    if (classes != null) {
      map['classes'] = classes?.map((v) => v.toJson()).toList();
    }
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 91
/// title : "<p>fsadfsdfasdf</p>"
/// answers : [{"id":292,"title":"sadfasdfdasfsadf","is_correct":false},{"id":293,"title":"fadsfsdafasfdsaf","is_correct":true},{"id":294,"title":"asdfasfsdfsadfasdfasdf","is_correct":false}]

class Questions {
  Questions({
    this.id,
    this.title,
    this.answers,
  });

  Questions.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
  }

  int? id;
  String? title;
  List<Answers>? answers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 292
/// title : "sadfasdfdasfsadf"
/// is_correct : false

class Answers {
  Answers({
    this.id,
    this.title,
    this.isCorrect,
  });

  Answers.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    isCorrect = json['is_correct'];
  }

  int? id;
  String? title;
  bool? isCorrect;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['is_correct'] = isCorrect;
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
