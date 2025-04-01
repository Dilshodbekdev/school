/// value : 1
/// label : "Чтение книг"

class HobbyModel {
  HobbyModel({
      this.value, 
      this.label,});

  HobbyModel.fromJson(dynamic json) {
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