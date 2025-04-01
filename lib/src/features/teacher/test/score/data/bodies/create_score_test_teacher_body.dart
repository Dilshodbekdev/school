/// name : "ball 1"
/// classes : [13]
/// test_time : "06:06:00"
/// started_date : "2024-12-02 12:00"
/// ended_date : "2024-12-26 12:00"
/// description : "des"
/// number_of_questions : 12
/// ball_descriptions : [{"min":12,"max":32,"description":"sdfv"}]
/// questions : [{"answers":[{"title":"ergv","ball":"12"},{"title":"sefrv","ball":"21"}],"title":"<p>aerwfvcser</p>"}]

class CreateScoreTestTeacherBody {
  CreateScoreTestTeacherBody({
    this.name,
    this.id,
    this.classes,
    this.testTime,
    this.startedDate,
    this.endedDate,
    this.description,
    this.numberOfQuestions,
    this.ballDescriptions,
    this.questions,
  });

  String? name;
  int? id;
  List<int>? classes;
  String? testTime;
  String? startedDate;
  String? endedDate;
  String? description;
  int? numberOfQuestions;
  List<BallDescriptionScore>? ballDescriptions;
  List<QuestionScore>? questions;

  CreateScoreTestTeacherBody copyWith({
    String? name,
    int? id,
    List<int>? classes,
    String? testTime,
    String? startedDate,
    String? endedDate,
    String? description,
    int? numberOfQuestions,
    List<BallDescriptionScore>? ballDescriptions,
    List<QuestionScore>? questions,
  }) =>
      CreateScoreTestTeacherBody(
        name: name ?? this.name,
        id: id ?? this.id,
        classes: classes ?? this.classes,
        testTime: testTime ?? this.testTime,
        startedDate: startedDate ?? this.startedDate,
        endedDate: endedDate ?? this.endedDate,
        description: description ?? this.description,
        numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
        ballDescriptions: ballDescriptions ?? this.ballDescriptions,
        questions: questions ?? this.questions,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['classes'] = classes;
    map['test_time'] = testTime;
    map['started_date'] = startedDate;
    map['ended_date'] = endedDate;
    map['description'] = description;
    map['number_of_questions'] = numberOfQuestions;
    if (ballDescriptions != null) {
      map['ball_descriptions'] =
          ballDescriptions?.map((v) => v.toJson()).toList();
    }
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// answers : [{"title":"ergv","ball":"12"},{"title":"sefrv","ball":"21"}]
/// title : "<p>aerwfvcser</p>"

class QuestionScore {
  QuestionScore({
    this.answers,
    this.title,
    this.id,
  });

  List<AnswerScore>? answers;
  String? title;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['title'] = title;
    map['id'] = id;
    return map;
  }
}

/// title : "ergv"
/// ball : "12"

class AnswerScore {
  AnswerScore({
    this.title,
    this.ball,
    this.id,
  });

  String? title;
  int? ball;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['ball'] = ball;
    map['id'] = id;
    return map;
  }
}

/// min : 12
/// max : 32
/// description : "sdfv"

class BallDescriptionScore {
  BallDescriptionScore({
    this.min,
    this.max,
    this.id,
    this.description,
  });

  int? min;
  int? max;
  int? id;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['min'] = min;
    map['max'] = max;
    map['id'] = id;
    map['description'] = description;
    return map;
  }
}
