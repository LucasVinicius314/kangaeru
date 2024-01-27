import 'package:flutter/material.dart';
import 'package:kangaeru/pages/home_page.dart';
import 'package:kangaeru/utils/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.route: (context) => const HomePage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      title: Constants.appName,
    );
  }
}
