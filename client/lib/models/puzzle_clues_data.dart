import 'package:json_annotation/json_annotation.dart';

part 'puzzle_clues_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class PuzzleCluesData {
  PuzzleCluesData({
    required this.across,
    required this.down,
  });

  List<String> across;
  List<String> down;

  factory PuzzleCluesData.fromJson(Map<String, dynamic> json) =>
      _$PuzzleCluesDataFromJson(json);

  Map<String, dynamic> toJson() => _$PuzzleCluesDataToJson(this);
}
