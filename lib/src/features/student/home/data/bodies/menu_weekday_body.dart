class MenuWeekdayBody {
  int? weekday;
  int? order;

  MenuWeekdayBody({
    this.weekday,
    this.order,
  });

  MenuWeekdayBody copyWith({
    int? weekday,
    int? order,
  }) =>
      MenuWeekdayBody(
        weekday: weekday ?? this.weekday,
        order: order ?? this.order,
      );
}
