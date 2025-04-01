class DateMarksBody {
  String? date;
  int? record;

  DateMarksBody({
    this.date,
    this.record,
  });

  DateMarksBody copyWith({
    String? date,
    int? record,
  }) =>
      DateMarksBody(
        date: date ?? this.date,
        record: record ?? this.record,
      );
}
