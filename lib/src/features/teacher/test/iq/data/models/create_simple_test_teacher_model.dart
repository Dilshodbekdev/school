/// id : 54
/// name : "test1"
/// classes : [13,20]
/// test_time : "06:00:00"
/// started_date : "26-11-2024 12:00"
/// ended_date : "29-11-2024 12:00"
/// template : null
/// description : "opisaniya"
/// questions : [{"id":118,"title":"<p>1 savol</p>","answers":[{"id":379,"title":"1javob","is_correct":true},{"id":380,"title":"adfv","is_correct":false},{"id":381,"title":"sfv","is_correct":false},{"id":382,"title":"adfv","is_correct":false}]},{"id":119,"title":"<p>aerfvsfgb</p>","answers":[{"id":383,"title":"ergvfser","is_correct":false},{"id":384,"title":"gvwsrewf","is_correct":true},{"id":385,"title":"werv","is_correct":false},{"id":386,"title":"srevb","is_correct":false}]}]
/// number_of_questions : 12
/// status : 1

class CreateSimpleTestTeacherModel {
  CreateSimpleTestTeacherModel({
    this.id,
    this.name,
    this.classes,
    this.testTime,
    this.startedDate,
    this.endedDate,
    this.template,
    this.description,
    this.questions,
    this.numberOfQuestions,
    this.status,
  });

  CreateSimpleTestTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    classes = json['classes'] != null ? json['classes'].cast<int>() : [];
    testTime = json['test_time'];
    startedDate = json['started_date'];
    endedDate = json['ended_date'];
    template = json['template'];
    description = json['description'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
    numberOfQuestions = json['number_of_questions'];
    status = json['status'];
  }

  int? id;
  String? name;
  List<int>? classes;
  String? testTime;
  String? startedDate;
  String? endedDate;
  dynamic template;
  String? description;
  List<Questions>? questions;
  int? numberOfQuestions;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['classes'] = classes;
    map['test_time'] = testTime;
    map['started_date'] = startedDate;
    map['ended_date'] = endedDate;
    map['template'] = template;
    map['description'] = description;
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    map['number_of_questions'] = numberOfQuestions;
    map['status'] = status;
    return map;
  }
}

/// id : 118
/// title : "<p>1 savol</p>"
/// answers : [{"id":379,"title":"1javob","is_correct":true},{"id":380,"title":"adfv","is_correct":false},{"id":381,"title":"sfv","is_correct":false},{"id":382,"title":"adfv","is_correct":false}]

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

/// id : 379
/// title : "1javob"
/// is_correct : true

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
