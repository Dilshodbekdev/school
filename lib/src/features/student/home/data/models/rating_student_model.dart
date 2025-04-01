/// id : 411
/// first_name : "123123"
/// last_name : "113123"
/// rank : null

class RatingStudentModel {
  RatingStudentModel({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.rank,});

  RatingStudentModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    rank = json['rank'];
  }
  int? id;
  String? firstName;
  String? lastName;
  double? rank;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['rank'] = rank;
    return map;
  }

}