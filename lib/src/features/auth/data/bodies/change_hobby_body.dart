/// hobby_id : [1,7,3]

class ChangeHobbyBody {
  ChangeHobbyBody({
    required this.hobbyId,
  });

  List<int> hobbyId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hobby'] = hobbyId;
    return map;
  }
}
