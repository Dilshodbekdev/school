/// value : 18
/// label : "Tasviriy san’at"

class ScienceStudentModel {
  ScienceStudentModel({
    this.value,
    this.label,
  });

  ScienceStudentModel.fromJson(dynamic json) {
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
