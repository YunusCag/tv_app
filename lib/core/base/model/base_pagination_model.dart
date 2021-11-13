class BasePaginationModel<T> {
  final List<T>? data;
  final int? current;
  final int? totalPages;
  final int? total;

  BasePaginationModel({
    this.data,
    this.current,
    this.total,
    this.totalPages,
  });
}
