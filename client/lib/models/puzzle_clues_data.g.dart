// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle_clues_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PuzzleCluesData _$PuzzleCluesDataFromJson(Map<String, dynamic> json) =>
    PuzzleCluesData(
      across:
          (json['across'] as List<dynamic>).map((e) => e as String).toList(),
      down: (json['down'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PuzzleCluesDataToJson(PuzzleCluesData instance) =>
    <String, dynamic>{
      'across': instance.across,
      'down': instance.down,
    };
