/// id : 98
/// test : 50
/// questions : [{"id":138,"question":"<p>savol1</p>","number":1,"options":[{"id":349,"title":"javob"},{"id":350,"title":"ascac"},{"id":351,"title":"erfgver"},{"id":352,"title":"ewfaer"}],"answer":{"id":349,"title":"javob"}},{"id":139,"question":"<p>aergfvasergvsfrv</p>","number":2,"options":[{"id":353,"title":"srb"},{"id":354,"title":"rbt"},{"id":355,"title":"bvbrfbv"}],"answer":null}]
/// test_time : 46740
/// helper_test_time : 45995

class GetSimpleTestStudentModel {
  GetSimpleTestStudentModel({
    this.id,
    this.test,
    this.questions,
    this.testTime,
    this.helperTestTime,
  });

  GetSimpleTestStudentModel.fromJson(dynamic json) {
    id = json['id'];
    test = json['test'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions.fromJson(v));
      });
    }
    testTime = json['test_time'];
    helperTestTime = json['helper_test_time'];
  }

  int? id;
  int? test;
  List<Questions>? questions;
  int? testTime;
  int? helperTestTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['test'] = test;
    if (questions != null) {
      map['questions'] = questions?.map((v) => v.toJson()).toList();
    }
    map['test_time'] = testTime;
    map['helper_test_time'] = helperTestTime;
    return map;
  }
}

/// id : 138
/// question : "<p>savol1</p>"
/// number : 1
/// options : [{"id":349,"title":"javob"},{"id":350,"title":"ascac"},{"id":351,"title":"erfgver"},{"id":352,"title":"ewfaer"}]
/// answer : {"id":349,"title":"javob"}

class Questions {
  Questions({
    this.id,
    this.question,
    this.number,
    this.options,
    this.answer,
  });

  Questions.fromJson(dynamic json) {
    id = json['id'];
    question = json['question'];
    number = json['number'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options1.fromJson(v));
      });
    }
    answer = json['answer'] != null ? Answer.fromJson(json['answer']) : null;
  }

  int? id;
  String? question;
  int? number;
  List<Options1>? options;
  Answer? answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    map['number'] = number;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    if (answer != null) {
      map['answer'] = answer?.toJson();
    }
    return map;
  }
}

/// id : 349
/// title : "javob"

class Answer {
  Answer({
    this.id,
    this.title,
  });

  Answer.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
  }

  int? id;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    return map;
  }
}

/// id : 349
/// title : "javob"

class Options1 {
  Options1({
    this.id,
    this.title,
  });

  Options1.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
  }

  int? id;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    return map;
  }
}
