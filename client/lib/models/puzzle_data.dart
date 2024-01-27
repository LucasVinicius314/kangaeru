import 'package:json_annotation/json_annotation.dart';
import 'package:kangaeru/models/puzzle_answers_data.dart';
import 'package:kangaeru/models/puzzle_clues_data.dart';
import 'package:kangaeru/models/puzzle_size_data.dart';

part 'puzzle_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.none, explicitToJson: true)
class PuzzleData {
  PuzzleData({
    required this.answers,
    required this.author,
    required this.clues,
    required this.copyright,
    required this.date,
    required this.dow,
    required this.editor,
    required this.grid,
    required this.gridnums,
    required this.publisher,
    required this.size,
    required this.title,
  });

  PuzzleAnswersData answers;
  String author;
  PuzzleCluesData clues;
  String copyright;
  String date;
  String dow;
  String editor;
  List<String> grid;
  List<int> gridnums;
  String publisher;
  PuzzleSizeData size;
  String title;

  factory PuzzleData.fromJson(Map<String, dynamic> json) =>
      _$PuzzleDataFromJson(json);

  Map<String, dynamic> toJson() => _$PuzzleDataToJson(this);
}
