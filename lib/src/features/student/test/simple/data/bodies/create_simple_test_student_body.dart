/// test : 48

class CreateSimpleTestStudentBody {
  CreateSimpleTestStudentBody({
    this.test,
  });

  CreateSimpleTestStudentBody.fromJson(dynamic json) {
    test = json['test'];
  }

  int? test;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['test'] = test;
    return map;
  }
}
