class RatingBody {
  int? quarterNumber;
  int? science;

  RatingBody({
    this.quarterNumber,
    this.science,
  });

  RatingBody copyWith({
    int? quarterNumber,
    int? science,
  }) =>
      RatingBody(
        quarterNumber: quarterNumber ?? this.quarterNumber,
        science: science ?? this.science,
      );
}
