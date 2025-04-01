/// name : "test"
/// classes : [13]
/// test_time : "07:45:00"
/// started_date : "1970-01-01 12:00"
/// ended_date : "1970-01-01 12:00"
/// description : "desc"
/// number_of_questions : 12
/// questions : [{"id":120,"title":"<p>1-question</p>","answers":[{"id":387,"title":"1-answer","is_correct":false},{"id":388,"title":"2-answer","is_correct":true},{"id":389,"title":"3-answer","is_correct":false}]},{"id":121,"title":"<p>2-question</p>","answers":[{"id":390,"title":"1-answer","is_correct":false},{"id":391,"title":"2-asnwer","is_correct":true}]}]

class CreateSimpleTestBody {
  CreateSimpleTestBody({
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
  List<Question>? questions;

  CreateSimpleTestBody copyWith({
    String? name,
    int? id,
    List<int>? classes,
    String? testTime,
    String? startedDate,
    String? endedDate,
    String? description,
    int? numberOfQuestions,
    List<Question>? questions,
  }) =>
      CreateSimpleTestBody(
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

/// id : 120
/// title : "<p>1-question</p>"
/// answers : [{"id":387,"title":"1-answer","is_correct":false},{"id":388,"title":"2-answer","is_correct":true},{"id":389,"title":"3-answer","is_correct":false}]

class Question {
  Question({
    this.id,
    this.title,
    this.answers,
  });

  int? id;
  String? title;
  List<Answer>? answers;

  Question copyWith({
    int? id,
    String? title,
    List<Answer>? answers,
  }) =>
      Question(
        id: id ?? this.id,
        title: title ?? this.title,
        answers: answers ?? this.answers,
      );

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

/// id : 387
/// title : "1-answer"
/// is_correct : false

class Answer {
  Answer({
    this.id,
    this.title,
    this.isCorrect,
  });

  int? id;
  String? title;
  bool? isCorrect;

  Answer copyWith({
    int? id,
    String? title,
    bool? isCorrect,
  }) =>
      Answer(
        id: id ?? this.id,
        title: title ?? this.title,
        isCorrect: isCorrect ?? this.isCorrect,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['is_correct'] = isCorrect;
    return map;
  }
}
