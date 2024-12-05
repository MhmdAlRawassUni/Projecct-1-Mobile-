import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_1/quiz.dart';

class TimerCustom extends StatefulWidget {
  const TimerCustom({super.key, required this.restartQuiz});

  final void Function() restartQuiz;

  @override
  State<TimerCustom> createState() => _TimerCustomState();
}

class _TimerCustomState extends State<TimerCustom> {
  int _countDownTimer = 180;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDownTimer > 0) {
          _countDownTimer--;
        } else {
          _timer?.cancel();
          _showEndDialog();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _showEndDialog() {
    showDialog(
        barrierColor: Colors.black54,
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Time Ended'),
            content: const Text('Restart Quiz?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => const MyApp(),
                    ),
                  );
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.restartQuiz();
                  Navigator.of(context).pop();
                  _countDownTimer = 180;
                  startTimer();
                },
                child: const Text('Restart'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Time left: $_countDownTimer seconds',
      style: GoogleFonts.lato(
        color: const Color.fromARGB(255, 11, 28, 60),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
