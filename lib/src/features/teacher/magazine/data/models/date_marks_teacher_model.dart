/// dates : [2659]
/// students : [{"student":{"id":411,"first_name":"123123","last_name":"113123","mid_name":"123123"},"marks":[4]},{"student":{"id":355,"first_name":"Nodirbek","last_name":"Adhamjonov","mid_name":"Odilxon o'g'li"},"marks":[null]},{"student":{"id":404,"first_name":"Shaxboz","last_name":"Alimov","mid_name":"Xalililloyevich"},"marks":[null]},{"student":{"id":370,"first_name":"sad","last_name":"asd","mid_name":"sad"},"marks":[null]},{"student":{"id":440,"first_name":"asdasd","last_name":"aseda 555","mid_name":"asdas"},"marks":[null]},{"student":{"id":347,"first_name":"new student","last_name":"new student","mid_name":"new student"},"marks":[null]},{"student":{"id":430,"first_name":"New student 1","last_name":"New student 1","mid_name":"New student 1"},"marks":[null]},{"student":{"id":439,"first_name":"New student 10","last_name":"New student 10","mid_name":"New student 10"},"marks":[null]},{"student":{"id":431,"first_name":"New student 2","last_name":"New student 2","mid_name":"New student 2"},"marks":[null]},{"student":{"id":432,"first_name":"New student 3","last_name":"New student 3","mid_name":"New student 3"},"marks":[null]},{"student":{"id":433,"first_name":"New student 4","last_name":"New student 4","mid_name":"New student 4"},"marks":[null]},{"student":{"id":434,"first_name":"New student 5","last_name":"New student 5","mid_name":"New student 5"},"marks":[null]},{"student":{"id":435,"first_name":"New student 6","last_name":"New student 6","mid_name":"New student 6"},"marks":[null]},{"student":{"id":436,"first_name":"New student 7","last_name":"New student 7","mid_name":"New student 7"},"marks":[null]},{"student":{"id":437,"first_name":"New student 8","last_name":"New student 8","mid_name":"New student 8"},"marks":[null]},{"student":{"id":438,"first_name":"New student 9","last_name":"New student 9","mid_name":"New student 9"},"marks":[null]},{"student":{"id":358,"first_name":"student1","last_name":"student","mid_name":"student2"},"marks":[null]},{"student":{"id":442,"first_name":"asasas","last_name":"talaba","mid_name":"asdasd"},"marks":[null]},{"student":{"id":367,"first_name":"test2","last_name":"test2","mid_name":"test2"},"marks":[null]},{"student":{"id":362,"first_name":"testov","last_name":"tests","mid_name":"Father name"},"marks":[null]},{"student":{"id":366,"first_name":"test student","last_name":"test student","mid_name":"test student"},"marks":[null]},{"student":{"id":414,"first_name":"wefqwefqf","last_name":"wefwfqwf","mid_name":"wefqwef"},"marks":[null]},{"student":{"id":349,"first_name":"Абдуссамихон","last_name":"Абдукаюмов","mid_name":"Абдуфоихович"},"marks":[null]},{"student":{"id":356,"first_name":"вцфвфц","last_name":"вцфвцф","mid_name":"вфцвфц"},"marks":[null]}]

class DateMarksTeacherModel {
  DateMarksTeacherModel({
    this.dates,
    this.students,
  });

  DateMarksTeacherModel.fromJson(dynamic json) {
    dates = json['dates'] != null ? json['dates'].cast<int>() : [];
    if (json['students'] != null) {
      students = [];
      json['students'].forEach((v) {
        students?.add(Students.fromJson(v));
      });
    }
  }

  List<int>? dates;
  List<Students>? students;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dates'] = dates;
    if (students != null) {
      map['students'] = students?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// student : {"id":411,"first_name":"123123","last_name":"113123","mid_name":"123123"}
/// marks : [4]

class Students {
  Students({
    this.student,
    this.marks,
  });

  Students.fromJson(dynamic json) {
    student = json['student'] != null ? Student.fromJson(json['student']) : null;
    marks = (json['marks'] as List<dynamic>?)?.map((mark) => mark as int?).toList();
  }

  Student? student;
  List<int?>? marks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (student != null) {
      map['student'] = student?.toJson();
    }
    map['marks'] = marks;
    return map;
  }
}

/// id : 411
/// first_name : "123123"
/// last_name : "113123"
/// mid_name : "123123"

class Student {
  Student({
    this.id,
    this.firstName,
    this.lastName,
    this.midName,
  });

  Student.fromJson(dynamic json) {
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
