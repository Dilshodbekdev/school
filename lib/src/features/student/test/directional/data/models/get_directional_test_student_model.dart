/// id : 13
/// test : 6
/// questions : [{"id":12,"question":"<p>asdv</p>","options":[{"id":26,"title":"12","ball":12},{"id":27,"title":"12","ball":21}],"answer":null}]
/// test_time : 25620
/// helper_test_time : 25619

class GetDirectionalTestStudentModel {
  GetDirectionalTestStudentModel({
    this.id,
    this.test,
    this.questions,
    this.testTime,
    this.helperTestTime,
  });

  GetDirectionalTestStudentModel.fromJson(dynamic json) {
    id = json['id'];
    test = json['test'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(Questions1.fromJson(v));
      });
    }
    testTime = json['test_time'];
    helperTestTime = json['helper_test_time'];
  }

  int? id;
  int? test;
  List<Questions1>? questions;
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

/// id : 12
/// question : "<p>asdv</p>"
/// options : [{"id":26,"title":"12","ball":12},{"id":27,"title":"12","ball":21}]
/// answer : null

class Questions1 {
  Questions1({
    this.id,
    this.question,
    this.options,
    this.answer,
  });

  Questions1.fromJson(dynamic json) {
    id = json['id'];
    question = json['question'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options2.fromJson(v));
      });
    }
    answer = json['answer'];
  }

  int? id;
  String? question;
  List<Options2>? options;
  dynamic answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    map['answer'] = answer;
    return map;
  }
}

/// id : 26
/// title : "12"
/// ball : 12

class Options2 {
  Options2({
    this.id,
    this.title,
    this.ball,
  });

  Options2.fromJson(dynamic json) {
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
