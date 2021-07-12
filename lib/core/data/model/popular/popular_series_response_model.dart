import 'package:json_annotation/json_annotation.dart';
import 'package:tv_app/core/data/model/series/series_model.dart';

part 'popular_series_response_model.g.dart';

@JsonSerializable()
class PopularSeriesResponseModel {
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "results")
  List<SeriesModel?>? popularList;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  PopularSeriesResponseModel({
    this.page,
    this.popularList,
    this.totalPages,
    this.totalResults,
  });

  factory PopularSeriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PopularSeriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularSeriesResponseModelToJson(this);
}
