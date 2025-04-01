/// name : "iq new"
/// classes : [13]
/// test_time : "07:07:00"
/// started_date : "2024-11-30 12:00"
/// ended_date : "2024-12-03 12:00"
/// description : "decp"
/// number_of_questions : 2
/// questions : [{"answers":[{"title":"111","ball":"12"},{"title":"12","ball":"45"},{"title":"1","ball":"45"}],"title":"<p>111</p>","direction":"test"}]

class CreateIqTestBody {
  CreateIqTestBody({
    this.name,
    this.id,
    this.classes,
    this.testTime,
    this.startedDate,
    this.endedDate,
    this.description,
    this.numberOfQuestions,
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
  List<QuestionIq>? questions;

  CreateIqTestBody copyWith({
    String? name,
    int? id,
    List<int>? classes,
    String? testTime,
    String? startedDate,
    String? endedDate,
    String? description,
    int? numberOfQuestions,
    List<QuestionIq>? questions,
  }) =>
      CreateIqTestBody(
        name: name ?? this.name,
        id: id ?? this.id,
        classes: classes ?? this.classes,
        testTime: testTime ?? this.testTime,
        startedDate: startedDate ?? this.startedDate,
        endedDate: endedDate ?? this.endedDate,
        description: description ?? this.description,
        numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
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
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// answers : [{"title":"111","ball":"12"},{"title":"12","ball":"45"},{"title":"1","ball":"45"}]
/// title : "<p>111</p>"
/// direction : "test"

class QuestionIq {
  QuestionIq({
    this.answers,
    this.title,
    this.id,
    this.direction,
  });

  List<AnswerIq>? answers;
  String? title;
  int? id;
  String? direction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answers != null) {
      map['answers'] = answers?.map((v) => v.toJson()).toList();
    }
    map['title'] = title;
    map['id'] = id;
    map['direction'] = direction;
    return map;
  }
}

/// title : "111"
/// ball : "12"

class AnswerIq {
  AnswerIq({
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
