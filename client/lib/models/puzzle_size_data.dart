import 'package:json_annotation/json_annotation.dart';

part 'puzzle_size_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class PuzzleSizeData {
  PuzzleSizeData({
    required this.cols,
    required this.rows,
  });

  int cols;
  int rows;

  factory PuzzleSizeData.fromJson(Map<String, dynamic> json) =>
      _$PuzzleSizeDataFromJson(json);

  Map<String, dynamic> toJson() => _$PuzzleSizeDataToJson(this);
}
