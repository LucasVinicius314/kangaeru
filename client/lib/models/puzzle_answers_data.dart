import 'package:json_annotation/json_annotation.dart';

part 'puzzle_answers_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class PuzzleAnswersData {
  PuzzleAnswersData({
    required this.across,
    required this.down,
  });

  List<String> across;
  List<String> down;

  factory PuzzleAnswersData.fromJson(Map<String, dynamic> json) =>
      _$PuzzleAnswersDataFromJson(json);

  Map<String, dynamic> toJson() => _$PuzzleAnswersDataToJson(this);
}
