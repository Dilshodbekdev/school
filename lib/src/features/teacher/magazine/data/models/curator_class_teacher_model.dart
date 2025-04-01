/// id : 13
/// number : 2
/// letter : "A"

class CuratorClassTeacherModel {
  CuratorClassTeacherModel({
    this.id,
    this.number,
    this.letter,
  });

  CuratorClassTeacherModel.fromJson(dynamic json) {
    id = json['id'];
    number = json['number'];
    letter = json['letter'];
  }

  int? id;
  int? number;
  String? letter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['number'] = number;
    map['letter'] = letter;
    return map;
  }
}
