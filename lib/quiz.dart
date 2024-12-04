import 'package:project_1/data/questions.dart';
import 'package:project_1/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:project_1/start_screen.dart';
import 'package:project_1/results_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        chooseAnswer,
        restartAnswers: restartAnswers,
      );
    });
  }

  void restartAnswers() {
    setState(() {
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedAnswers, quizRestart);
      });
    }
  }

  void quizRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(
        chooseAnswer,
        restartAnswers: restartAnswers,
      );
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2A60FF),
                Color.fromARGB(255, 172, 172, 175),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
