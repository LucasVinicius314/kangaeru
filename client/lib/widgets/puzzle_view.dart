import 'package:flutter/material.dart';
import 'package:kangaeru/models/puzzle_data.dart';

class PuzzleView extends StatefulWidget {
  const PuzzleView({
    super.key,
    required this.puzzle,
  });

  final PuzzleData puzzle;

  @override
  State<PuzzleView> createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  @override
  Widget build(BuildContext context) {
    // TODO: fix

    final cellMap = <(int, int), String>{};

    for (var (index, cell) in widget.puzzle.grid.indexed) {
      final x = index % widget.puzzle.size.cols;
      final y = index ~/ widget.puzzle.size.rows;

      cellMap[(x, y)] = cell;
    }

    const cellSize = 64.0;
    const cellSpacing = 4.0;

    final height = widget.puzzle.size.rows * cellSize +
        (widget.puzzle.size.rows - 1) * cellSpacing;

    final width = widget.puzzle.size.cols * cellSize +
        (widget.puzzle.size.cols - 1) * cellSpacing;

    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.loose,
          children:
              cellMap.entries.where((element) => element.value != '.').map((e) {
            return Positioned(
              left: e.key.$1 * (cellSize + cellSpacing),
              top: e.key.$2 * (cellSize + cellSpacing),
              height: cellSize,
              width: cellSize,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.black12,
                child:
                    Center(child: Text(e.value, textAlign: TextAlign.center)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
