/// id : 11
/// name : "ball 1"
/// test_time : "06:06:00"
/// started_date : "02-12-2024 12:00"
/// ended_date : "26-12-2024 12:00"
/// status : 1
/// number_of_questions : 12
/// description : "des"
/// classes : [{"id":13,"letter":"A","number":2}]
/// questions : [{"id":17,"title":"<p>aerwfvcser</p>","answers":[{"id":46,"title":"ergv","ball":12},{"id":47,"title":"sefrv","ball":21}]}]
/// ball_descriptions : [{"id":22,"min":12,"max":32,"description":"sdfv"}]

class GetScoreTestTeacherModel {
  GetScoreTestTeacherModel({
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
    this.ballDescriptions,
  });

  GetScoreTestTeacherModel.fromJson(dynamic json) {
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
    if (json['ball_descriptions'] != null) {
      ballDescriptions = [];
      json['ball_descriptions'].forEach((v) {
        ballDescriptions?.add(BallDescriptions.fromJson(v));
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
  List<BallDescriptions>? ballDescriptions;

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
    if (ballDescriptions != null) {
      map['ball_descriptions'] =
          ballDescriptions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 22
/// min : 12
/// max : 32
/// description : "sdfv"

class BallDescriptions {
  BallDescriptions({
    this.id,
    this.min,
    this.max,
    this.description,});

  BallDescriptions.fromJson(dynamic json) {
    id = json['id'];
    min = json['min'];
    max = json['max'];
    description = json['description'];
  }

  int? id;
  int? min;
  int? max;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['min'] = min;
    map['max'] = max;
    map['description'] = description;
    return map;
  }

}

/// id : 17
/// title : "<p>aerwfvcser</p>"
/// answers : [{"id":46,"title":"ergv","ball":12},{"id":47,"title":"sefrv","ball":21}]

class Questions {
  Questions({
    this.id,
    this.title,
    this.answers,});

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

/// id : 46
/// title : "ergv"
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['letter'] = letter;
    map['number'] = number;
    return map;
  }

}