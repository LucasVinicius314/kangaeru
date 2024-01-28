import 'package:flutter/material.dart';
import 'package:kangaeru/models/puzzle_data.dart';

class PuzzleView extends StatefulWidget {
  const PuzzleView({
    super.key,
    required this.cellSize,
    required this.cellSpacing,
    required this.puzzle,
  });

  final double cellSize;
  final double cellSpacing;
  final PuzzleData puzzle;

  @override
  State<PuzzleView> createState() => _PuzzleViewState();
}

class _PuzzleViewState extends State<PuzzleView> {
  final _controller = PuzzleController();

  @override
  Widget build(BuildContext context) {
    final cells = <Cell>[];

    var wordIndex = 0;

    final wordMap = <int, Word>{};

    for (var (index, answer) in widget.puzzle.grid.indexed) {
      if (answer != '.') {
        final x = index % widget.puzzle.size.cols;
        final y = index ~/ widget.puzzle.size.rows;

        final cell = Cell(
          answer: answer,
          content: '',
          controller: CellTileController(),
          id: index,
          state: PuzzleState.incomplete,
          words: [],
          x: x,
          y: y,
        );

        cells.add(cell);

        if (!wordMap.containsKey(wordIndex)) {
          wordMap[wordIndex] = Word(
            answer: '',
            cells: [],
            clue: Clue(id: 0, text: ''),
            // TODO: define word direction
            direction: WordDirection.horizontal,
            id: wordIndex,
            state: PuzzleState.incomplete,
          );
        }

        wordMap[wordIndex]!.cells.add(cell);

        if (x == widget.puzzle.size.cols - 1) {
          wordIndex++;
        }
      } else {
        wordIndex++;
      }
    }

    for (var (index, word) in wordMap.values.indexed) {
      if (word.direction == WordDirection.horizontal) {
        word.answer = widget.puzzle.answers.across[index];
        word.clue = Clue(id: index, text: widget.puzzle.clues.across[index]);
      }

      for (var cell in word.cells) {
        cell.words.add(word);
      }
    }

    final height = widget.puzzle.size.rows * widget.cellSize +
        (widget.puzzle.size.rows - 1) * widget.cellSpacing;

    final width = widget.puzzle.size.cols * widget.cellSize +
        (widget.puzzle.size.cols - 1) * widget.cellSpacing;

    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.loose,
          children: cells.map((cell) {
            return Positioned(
              left: cell.x * (widget.cellSize + widget.cellSpacing),
              top: cell.y * (widget.cellSize + widget.cellSpacing),
              height: widget.cellSize,
              width: widget.cellSize,
              child: CellTile(cell: cell, puzzleController: _controller),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class PuzzleController extends ChangeNotifier {
  Cell? _selectedCell;
  Word? _highlightedWord;

  void setSelection({
    required Cell selectedCell,
    required Word highlightedWord,
  }) {
    if (_highlightedWord != null) {
      for (var cell in _highlightedWord!.cells) {
        cell.controller.setState(CellTileState.none);
      }
    }

    _selectedCell = selectedCell;
    _highlightedWord = highlightedWord;

    notifyListeners();
  }
}

class CellTileController extends ChangeNotifier {
  var _state = CellTileState.none;

  CellTileState get state {
    return _state;
  }

  void setState(CellTileState value) {
    _state = value;

    notifyListeners();
  }
}

enum CellTileState {
  highlighted,
  selected,
  none,
}

// TODO: move
class CellTile extends StatelessWidget {
  const CellTile({
    super.key,
    required this.cell,
    required this.puzzleController,
  });

  final Cell cell;
  final PuzzleController puzzleController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cell.controller,
      builder: (context, child) {
        ShapeBorder shapeBorder;

        switch (cell.controller.state) {
          case CellTileState.highlighted:
            shapeBorder = RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(.5),
                width: 2,
              ),
            );

            break;
          case CellTileState.none:
            shapeBorder = const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            );

            break;
          case CellTileState.selected:
            shapeBorder = RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            );

            break;
        }

        return Material(
          clipBehavior: Clip.antiAlias,
          color: Colors.black.withOpacity(.05),
          shape: shapeBorder,
          child: InkWell(
            onTap: () {
              final word = cell.words.first;

              puzzleController.setSelection(
                highlightedWord: word,
                selectedCell: cell,
              );

              for (var wordCell in word.cells) {
                if (wordCell == cell) {
                  wordCell.controller.setState(CellTileState.selected);
                } else {
                  wordCell.controller.setState(CellTileState.highlighted);
                }
              }
            },
            child: Center(
              child: Text(cell.answer, textAlign: TextAlign.center),
            ),
          ),
        );
      },
    );
  }
}

// TODO: move
class Cell {
  Cell({
    required this.answer,
    required this.content,
    required this.controller,
    required this.id,
    required this.state,
    required this.words,
    required this.x,
    required this.y,
  });

  String answer;
  String content;
  CellTileController controller;
  int id;
  PuzzleState state;
  List<Word> words;
  int x;
  int y;

  @override
  String toString() {
    return answer;
  }
}

class Clue {
  Clue({
    required this.id,
    required this.text,
  });

  int id;
  String text;
}

enum PuzzleState {
  correct,
  incomplete,
  incorrect,
}

class Word {
  Word({
    required this.answer,
    required this.cells,
    required this.clue,
    required this.direction,
    required this.id,
    required this.state,
  });

  String answer;
  List<Cell> cells;
  Clue clue;
  WordDirection direction;
  int id;
  PuzzleState state;

  @override
  String toString() {
    return answer;
  }
}

enum WordDirection {
  horizontal,
  vertical,
}
