/// id : 57
/// class_ref : {"id":13,"letter":"A","number":2}
/// weekday : 2
/// sequence : 1
/// type : 1
/// lessons : [{"id":61,"week_order":1,"group_type":null,"subject":{"id":18,"name":"Tasviriy san’at","type":1},"teacher":{"id":351,"first_name":"Говхар","last_name":"Хожиева","mid_name":"Шавкатовна"}}]

class TimetableStudentModel {
  TimetableStudentModel({
    this.id,
    this.classRef,
    this.weekday,
    this.sequence,
    this.type,
    this.lessons,
  });

  TimetableStudentModel.fromJson(dynamic json) {
    id = json['id'];
    classRef =
        json['class_ref'] != null ? ClassRef.fromJson(json['class_ref']) : null;
    weekday = json['weekday'];
    sequence = json['sequence'];
    type = json['type'];
    if (json['lessons'] != null) {
      lessons = [];
      json['lessons'].forEach((v) {
        lessons?.add(Lessons.fromJson(v));
      });
    }
  }

  int? id;
  ClassRef? classRef;
  int? weekday;
  int? sequence;
  int? type;
  List<Lessons>? lessons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (classRef != null) {
      map['class_ref'] = classRef?.toJson();
    }
    map['weekday'] = weekday;
    map['sequence'] = sequence;
    map['type'] = type;
    if (lessons != null) {
      map['lessons'] = lessons?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 61
/// week_order : 1
/// group_type : null
/// subject : {"id":18,"name":"Tasviriy san’at","type":1}
/// teacher : {"id":351,"first_name":"Говхар","last_name":"Хожиева","mid_name":"Шавкатовна"}

class Lessons {
  Lessons({
    this.id,
    this.weekOrder,
    this.groupType,
    this.subject,
    this.teacher,
  });

  Lessons.fromJson(dynamic json) {
    id = json['id'];
    weekOrder = json['week_order'];
    groupType = json['group_type'];
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    teacher =
        json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
  }

  int? id;
  int? weekOrder;
  dynamic groupType;
  Subject? subject;
  Teacher? teacher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['week_order'] = weekOrder;
    map['group_type'] = groupType;
    if (subject != null) {
      map['subject'] = subject?.toJson();
    }
    if (teacher != null) {
      map['teacher'] = teacher?.toJson();
    }
    return map;
  }
}

/// id : 351
/// first_name : "Говхар"
/// last_name : "Хожиева"
/// mid_name : "Шавкатовна"

class Teacher {
  Teacher({
    this.id,
    this.firstName,
    this.lastName,
    this.midName,
  });

  Teacher.fromJson(dynamic json) {
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

/// id : 18
/// name : "Tasviriy san’at"
/// type : 1

class Subject {
  Subject({
    this.id,
    this.name,
    this.type,
  });

  Subject.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  int? id;
  String? name;
  int? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    return map;
  }
}

/// id : 13
/// letter : "A"
/// number : 2

class ClassRef {
  ClassRef({
    this.id,
    this.letter,
    this.number,
  });

  ClassRef.fromJson(dynamic json) {
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
