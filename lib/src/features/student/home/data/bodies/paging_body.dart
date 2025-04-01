class PagingBody {
  int? page;
  int? pageSize = 10;
  String? search;

  PagingBody({
    this.page,
    this.pageSize,
    this.search,
  });

  PagingBody copyWith({
    int? page,
    int? pageSize,
    String? search,
  }) =>
      PagingBody(
        page: page ?? this.page,
        pageSize: pageSize ?? this.pageSize,
        search: search ?? this.search,
      );
}
