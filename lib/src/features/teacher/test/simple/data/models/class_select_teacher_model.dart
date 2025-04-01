/// value : 14
/// label : "1-B"
/// number : 1

class ClassSelectTeacherModel {
  ClassSelectTeacherModel({
    this.value,
    this.label,
    this.number,
  });

  ClassSelectTeacherModel.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
    number = json['number'];
  }

  int? value;
  String? label;
  int? number;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    map['number'] = number;
    return map;
  }
}
