import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kangaeru/models/puzzle_data.dart';

class PuzzleRepository {
  Future<PuzzleData> getExamplePuzzle(BuildContext context) async {
    final data = await DefaultAssetBundle.of(context)
        .loadString("assets/puzzles/example.json");

    return PuzzleData.fromJson(jsonDecode(data));
  }
}
