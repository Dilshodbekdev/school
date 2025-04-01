/// id : 6
/// name : "directional test"
/// test_time : "07:07:00"
/// started_date : "01-12-2024 12:00"
/// ended_date : "04-01-2025 12:00"
/// status : 1
/// number_of_questions : 2
/// description : "dexp"
/// classes : [{"id":13,"letter":"A","number":2}]
/// questions : [{"id":10,"title":"<p>asdv</p>","direction":"dire","answers":[{"id":26,"title":"12","ball":12},{"id":27,"title":"12","ball":21}]}]

class GetIqTestTeacherModel {
  GetIqTestTeacherModel({
      this.id, 
      this.name, 
      this.testTime, 
      this.startedDate, 
      this.endedDate, 
      this.status, 
      this.numberOfQuestions, 
      this.description, 
      this.classes, 
      this.questions,});

  GetIqTestTeacherModel.fromJson(dynamic json) {
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
GetIqTestTeacherModel copyWith({  int? id,
  String? name,
  String? testTime,
  String? startedDate,
  String? endedDate,
  int? status,
  int? numberOfQuestions,
  String? description,
  List<Classes>? classes,
  List<Questions>? questions,
}) => GetIqTestTeacherModel(  id: id ?? this.id,
  name: name ?? this.name,
  testTime: testTime ?? this.testTime,
  startedDate: startedDate ?? this.startedDate,
  endedDate: endedDate ?? this.endedDate,
  status: status ?? this.status,
  numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
  description: description ?? this.description,
  classes: classes ?? this.classes,
  questions: questions ?? this.questions,
);
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

/// id : 10
/// title : "<p>asdv</p>"
/// direction : "dire"
/// answers : [{"id":26,"title":"12","ball":12},{"id":27,"title":"12","ball":21}]

class Questions {
  Questions({
      this.id, 
      this.title, 
      this.direction, 
      this.answers,});

  Questions.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    direction = json['direction'];
    if (json['answers'] != null) {
      answers = [];
      json['answers'].forEach((v) {
        answers?.add(Answers.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  String? direction;
  List<Answers>? answers;
Questions copyWith({  int? id,
  String? title,
  String? direction,
  List<Answers>? answers,
}) => Questions(  id: id ?? this.id,
  title: title ?? this.title,
  direction: direction ?? this.direction,
  answers: answers ?? this.answers,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['direction'] = direction;
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 26
/// title : "12"
/// ball : 12

class Answers {
  Answers({
      this.id, 
      this.title, 
      this.ball,});

  Answers.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    ball = json['ball'];
  }
  int? id;
  String? title;
  int? ball;
Answers copyWith({  int? id,
  String? title,
  int? ball,
}) => Answers(  id: id ?? this.id,
  title: title ?? this.title,
  ball: ball ?? this.ball,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['ball'] = ball;
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
      this.number,});

  Classes.fromJson(dynamic json) {
    id = json['id'];
    letter = json['letter'];
    number = json['number'];
  }
  int? id;
  String? letter;
  int? number;
Classes copyWith({  int? id,
  String? letter,
  int? number,
}) => Classes(  id: id ?? this.id,
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