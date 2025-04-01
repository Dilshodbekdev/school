/// column : 1
/// name : "nomer"

class ReadColumnTeacherModel {
  ReadColumnTeacherModel({
    this.column,
    this.name,
  });

  ReadColumnTeacherModel.fromJson(dynamic json) {
    column = json['column'];
    name = json['name'];
  }

  int? column;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['column'] = column;
    map['name'] = name;
    return map;
  }
}
