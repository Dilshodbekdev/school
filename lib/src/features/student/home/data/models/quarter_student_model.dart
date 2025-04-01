/// id : 7
/// created_at : "27-09-2024 09:38"
/// updated_at : "27-09-2024 09:43"
/// number : 1
/// start_date : "04-09-2024"
/// end_date : "05-11-2024"
/// year : 1

class QuarterStudentModel {
  QuarterStudentModel({
    this.id,
    this.number,
    this.startDate,
    this.endDate,
  });

  QuarterStudentModel.fromJson(dynamic json) {
    id = json['id'];
    number = json['number'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  int? id;
  int? number;
  String? startDate;
  String? endDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['number'] = number;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    return map;
  }
}
