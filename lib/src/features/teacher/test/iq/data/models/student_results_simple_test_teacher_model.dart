/// id : 101
/// submitter : {"id":349,"first_name":"Абдуссамихон","last_name":"Абдукаюмов","mid_name":"Абдуфоихович"}
/// results : [{"id":143,"question":"<p>4 savol</p>","options":[{"id":370,"title":"12 javob","is_correct":false},{"id":371,"title":"13 javob","is_correct":true},{"id":372,"title":"14 javob","is_correct":false}],"answer":null,"number":1},{"id":144,"question":"<p>5 savol</p>","options":[{"id":373,"title":"15 javob","is_correct":false},{"id":374,"title":"16 javob","is_correct":true},{"id":375,"title":"17 javob","is_correct":false}],"answer":null,"number":2},{"id":145,"question":"<p>3 savol</p>","options":[{"id":366,"title":"8 javob","is_correct":false},{"id":367,"title":"9 javob","is_correct":true},{"id":368,"title":"10 javob","is_correct":false},{"id":369,"title":"11 javob","is_correct":false}],"answer":{"id":368,"title":"10 javob","is_correct":false},"number":3},{"id":146,"question":"<p>1 savol</p>","options":[{"id":359,"title":"1 javob","is_correct":false},{"id":360,"title":"2 javob","is_correct":true},{"id":361,"title":"3 javpb","is_correct":false},{"id":362,"title":"4 javob","is_correct":false}],"answer":{"id":361,"title":"3 javpb","is_correct":false},"number":4},{"id":147,"question":"<p>2 savol</p>","options":[{"id":363,"title":"5 savol","is_correct":true},{"id":364,"title":"6 savol","is_correct":false},{"id":365,"title":"7 savol","is_correct":false}],"answer":null,"number":5}]
/// count : 0
/// spent_time : 1648
/// state : 2
/// created_at : "15-11-2024 15:56"
/// ended_date : "15-11-2024 16:23"

class StudentResultsSimpleTestTeacherModel {
  StudentResultsSimpleTestTeacherModel({
    this.id,
    this.submitter,
    this.results,
    this.count,
    this.spentTime,
    this.state,
    this.createdAt,
    this.endedDate,
  });

  StudentResultsSimpleTestTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    submitter = json['submitter'] != null
        ? Submitter.fromJson(json['submitter'])
        : null;
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    count = json['count'];
    spentTime = json['spent_time'];
    state = json['state'];
    createdAt = json['created_at'];
    endedDate = json['ended_date'];
  }

  int? id;
  Submitter? submitter;
  List<Results>? results;
  int? count;
  int? spentTime;
  int? state;
  String? createdAt;
  String? endedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (submitter != null) {
      map['submitter'] = submitter?.toJson();
    }
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    map['spent_time'] = spentTime;
    map['state'] = state;
    map['created_at'] = createdAt;
    map['ended_date'] = endedDate;
    return map;
  }
}

/// id : 143
/// question : "<p>4 savol</p>"
/// options : [{"id":370,"title":"12 javob","is_correct":false},{"id":371,"title":"13 javob","is_correct":true},{"id":372,"title":"14 javob","is_correct":false}]
/// answer : null
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
        options?.add(Options2.fromJson(v));
      });
    }
    answer = json['answer'] != null ? Options2.fromJson(json['answer']) : null;
    number = json['number'];
  }

  int? id;
  String? question;
  List<Options2>? options;
  Options2? answer;
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

/// id : 370
/// title : "12 javob"
/// is_correct : false

class Options2 {
  Options2({
    this.id,
    this.title,
    this.isCorrect,
  });

  Options2.fromJson(dynamic json) {
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
/// first_name : "Абдуссамихон"
/// last_name : "Абдукаюмов"
/// mid_name : "Абдуфоихович"

class Submitter {
  Submitter({
    this.id,
    this.firstName,
    this.lastName,
    this.midName,
  });

  Submitter.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    midName = json['mid_name'];
  }

  int? id;
  String? firstName;
  String? lastName;
  String? midName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['mid_name'] = midName;
    return map;
  }
}
