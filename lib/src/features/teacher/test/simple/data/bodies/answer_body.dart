/// answer : 351

class AnswerBody {
  AnswerBody({
    this.answer,
  });

  AnswerBody.fromJson(dynamic json) {
    answer = json['answer'];
  }

  int? answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    return map;
  }
}
