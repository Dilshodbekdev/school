/// answer : 351

class AnswerBody {
  AnswerBody({
    this.answer,
    this.questionId,
  });

  int? answer;
  int? questionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    return map;
  }
}
