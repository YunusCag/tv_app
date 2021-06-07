import 'package:json_annotation/json_annotation.dart';
import 'package:tv_app/core/data/model/series_model.dart';

part 'top_rated_series_response_model.g.dart';

@JsonSerializable()
class TopRatedSeriesResponseModel {
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "results")
  List<SeriesModel?>? topRatedList;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  TopRatedSeriesResponseModel({
    this.page,
    this.topRatedList,
    this.totalPages,
    this.totalResults,
  });

  factory TopRatedSeriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TopRatedSeriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedSeriesResponseModelToJson(this);
}
