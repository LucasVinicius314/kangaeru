import 'package:flutter/material.dart';
import 'package:kangaeru/models/puzzle_data.dart';
import 'package:kangaeru/repositories/puzzle_repository.dart';
import 'package:kangaeru/utils/constants.dart';
import 'package:kangaeru/widgets/loading_indicator.dart';
import 'package:kangaeru/widgets/puzzle_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final repo = PuzzleRepository();

    return Scaffold(
      appBar: AppBar(title: const Text(Constants.appName)),
      body: FutureBuilder<PuzzleData>(
        future: repo.getExamplePuzzle(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            final data = snapshot.data;

            if (data == null) {
              return const Text('Data is null.');
            }

            return PuzzleView(puzzle: data);
          }

          return const LoadingIndicator();
        },
      ),
    );
  }
}
