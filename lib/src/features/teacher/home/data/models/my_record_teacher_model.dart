/// id : 29
/// class_ref : {"id":14,"letter":"B","number":1}
/// subject : {"value":10,"label":"Информатика"}

class MyRecordTeacherModel {
  MyRecordTeacherModel({
    this.id,
    this.classRef,
    this.subject,
  });

  MyRecordTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    classRef =
        json['class_ref'] != null ? ClassRef.fromJson(json['class_ref']) : null;
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
  }

  int? id;
  ClassRef? classRef;
  Subject? subject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (classRef != null) {
      map['class_ref'] = classRef?.toJson();
    }
    if (subject != null) {
      map['subject'] = subject?.toJson();
    }
    return map;
  }
}

/// value : 10
/// label : "Информатика"

class Subject {
  Subject({
    this.value,
    this.label,
  });

  Subject.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }

  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }
}

/// id : 14
/// letter : "B"
/// number : 1

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
