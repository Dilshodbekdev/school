class RecordBody {
  int? quarter;
  int? record;

  RecordBody({
    this.quarter,
    this.record,
  });

  RecordBody copyWith({
    int? quarter,
    int? record,
  }) =>
      RecordBody(
        quarter: quarter ?? this.quarter,
        record: record ?? this.record,
      );
}
