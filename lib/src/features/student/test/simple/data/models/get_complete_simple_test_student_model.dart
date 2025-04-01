/// id : 98
/// name : "Matem"
/// results : [{"id":138,"question":"<p>savol1</p>","options":[{"id":349,"title":"javob","is_correct":false},{"id":350,"title":"ascac","is_correct":true},{"id":351,"title":"erfgver","is_correct":false},{"id":352,"title":"ewfaer","is_correct":false}],"answer":{"id":350,"title":"ascac","is_correct":true},"number":1},{"id":139,"question":"<p>aergfvasergvsfrv</p>","options":[{"id":353,"title":"srb","is_correct":true},{"id":354,"title":"rbt","is_correct":false},{"id":355,"title":"bvbrfbv","is_correct":false}],"answer":{"id":355,"title":"bvbrfbv","is_correct":false},"number":2}]
/// test_time : "12:59:00"
/// ended_date : "14-11-2024 18:19"
/// created_at : "14-11-2024 10:16"
/// state : 2
/// count : 1
/// spent_time : 29015

class GetCompleteSimpleTestStudentModel {
  GetCompleteSimpleTestStudentModel({
    this.id,
    this.name,
    this.results,
    this.testTime,
    this.endedDate,
    this.createdAt,
    this.state,
    this.count,
    this.spentTime,
  });

  GetCompleteSimpleTestStudentModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    testTime = json['test_time'];
    endedDate = json['ended_date'];
    createdAt = json['created_at'];
    state = json['state'];
    count = json['count'];
    spentTime = json['spent_time'];
  }

  int? id;
  String? name;
  List<Results>? results;
  String? testTime;
  String? endedDate;
  String? createdAt;
  int? state;
  int? count;
  int? spentTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['test_time'] = testTime;
    map['ended_date'] = endedDate;
    map['created_at'] = createdAt;
    map['state'] = state;
    map['count'] = count;
    map['spent_time'] = spentTime;
    return map;
  }
}

/// id : 138
/// question : "<p>savol1</p>"
/// options : [{"id":349,"title":"javob","is_correct":false},{"id":350,"title":"ascac","is_correct":true},{"id":351,"title":"erfgver","is_correct":false},{"id":352,"title":"ewfaer","is_correct":false}]
/// answer : {"id":350,"title":"ascac","is_correct":true}
/// number : 1

class Results {
  Results({
    this.id,
    this.question,
    this.options,
    this.answer,
    this.number,
  });

  Results.fromJson(dynamic json) {
    id = json['id'];
    question = json['question'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options1.fromJson(v));
      });
    }
    answer = json['answer'] != null ? Answer.fromJson(json['answer']) : null;
    number = json['number'];
  }

  int? id;
  String? question;
  List<Options1>? options;
  Answer? answer;
  int? number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    if (answer != null) {
      map['answer'] = answer?.toJson();
    }
    map['number'] = number;
    return map;
  }
}

/// id : 350
/// title : "ascac"
/// is_correct : true

class Answer {
  Answer({
    this.id,
    this.title,
    this.isCorrect,
  });

  Answer.fromJson(dynamic json) {
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

/// id : 349
/// title : "javob"
/// is_correct : false

class Options1 {
  Options1({
    this.id,
    this.title,
    this.isCorrect,
  });

  Options1.fromJson(dynamic json) {
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
