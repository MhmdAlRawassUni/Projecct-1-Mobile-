import 'package:flutter/material.dart';
import 'package:project_1/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_1/timer.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
    this.chosenAnswer, {
    super.key,
    required this.restartAnswers,
  });

  final void Function() restartAnswers;

  final void Function(String answer) chosenAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion(String answer) {
    widget.chosenAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
    });
    widget.restartAnswers();
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TimerCustom(
              restartQuiz: restartQuiz,
            ),
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 11, 28, 60),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButtons(item, () {
                nextQuestion(item);
              });
            }),
          ],
        ),
      ),
    );
  }
}

class AnswerButtons extends StatelessWidget {
  const AnswerButtons(this.answer, this.press, {super.key});

  final String answer;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color(0xFF2A60FF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          answer,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
