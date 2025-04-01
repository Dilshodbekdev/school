/// title : "title"
/// homework : "homework"

class UpdatePlanBody {
  UpdatePlanBody({
    this.title,
    this.homework,
    this.id,
  });

  UpdatePlanBody.fromJson(dynamic json) {
    title = json['title'];
    homework = json['homework'];
  }

  String? title;
  String? homework;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['homework'] = homework;
    return map;
  }
}
