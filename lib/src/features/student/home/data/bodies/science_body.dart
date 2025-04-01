class ScienceBody {
  int? type;
  int? classRef;

  ScienceBody({
    this.type,
    this.classRef,
  });

  ScienceBody copyWith({
    int? type,
    int? classRef,
  }) =>
      ScienceBody(
        type: type ?? this.type,
        classRef: classRef ?? this.classRef,
      );
}
