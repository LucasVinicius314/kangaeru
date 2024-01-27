// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle_answers_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PuzzleAnswersData _$PuzzleAnswersDataFromJson(Map<String, dynamic> json) =>
    PuzzleAnswersData(
      across:
          (json['across'] as List<dynamic>).map((e) => e as String).toList(),
      down: (json['down'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PuzzleAnswersDataToJson(PuzzleAnswersData instance) =>
    <String, dynamic>{
      'across': instance.across,
      'down': instance.down,
    };
