/// id : 138
/// answer : {"id":352,"title":"ewfaer"}
/// number : 1
/// question : "<p>savol1</p>"
/// options : [{"id":349,"title":"javob"},{"id":350,"title":"ascac"},{"id":351,"title":"erfgver"},{"id":352,"title":"ewfaer"}]

class AnswerSimpleTestStudentModel {
  AnswerSimpleTestStudentModel({
    this.id,
    this.answer,
    this.number,
    this.question,
    this.options,
  });

  AnswerSimpleTestStudentModel.fromJson(dynamic json) {
    id = json['id'];
    answer = json['answer'] != null ? Answer.fromJson(json['answer']) : null;
    number = json['number'];
    question = json['question'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options1.fromJson(v));
      });
    }
  }

  int? id;
  Answer? answer;
  int? number;
  String? question;
  List<Options1>? options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (answer != null) {
      map['answer'] = answer?.toJson();
    }
    map['number'] = number;
    map['question'] = question;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
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

/// id : 352
/// title : "ewfaer"

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
