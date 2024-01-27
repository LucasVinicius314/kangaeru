// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PuzzleData _$PuzzleDataFromJson(Map<String, dynamic> json) => PuzzleData(
      answers:
          PuzzleAnswersData.fromJson(json['answers'] as Map<String, dynamic>),
      author: json['author'] as String,
      clues: PuzzleCluesData.fromJson(json['clues'] as Map<String, dynamic>),
      copyright: json['copyright'] as String,
      date: json['date'] as String,
      dow: json['dow'] as String,
      editor: json['editor'] as String,
      grid: (json['grid'] as List<dynamic>).map((e) => e as String).toList(),
      gridnums:
          (json['gridnums'] as List<dynamic>).map((e) => e as int).toList(),
      publisher: json['publisher'] as String,
      size: PuzzleSizeData.fromJson(json['size'] as Map<String, dynamic>),
      title: json['title'] as String,
    );

Map<String, dynamic> _$PuzzleDataToJson(PuzzleData instance) =>
    <String, dynamic>{
      'answers': instance.answers.toJson(),
      'author': instance.author,
      'clues': instance.clues.toJson(),
      'copyright': instance.copyright,
      'date': instance.date,
      'dow': instance.dow,
      'editor': instance.editor,
      'grid': instance.grid,
      'gridnums': instance.gridnums,
      'publisher': instance.publisher,
      'size': instance.size.toJson(),
      'title': instance.title,
    };
