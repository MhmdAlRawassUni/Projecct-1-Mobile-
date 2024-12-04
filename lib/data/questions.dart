import 'package:project_1/models/quiz_questions.dart';

const questions = [
  QuizQuestions(
    'Which method is used to build the UI in a Flutter widget?',
    [
      'build()',
      'initState()',
      'setState()',
      'render()',
    ],
  ),
  QuizQuestions('What widget is used to create an app bar in Flutter?', [
    'AppBar()',
    'Scaffold()',
    'Container()',
    'Column()',
  ]),
  QuizQuestions(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestions(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestions(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestions(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
  QuizQuestions(
      'Which widget is used to arrange its children in a vertical column in Flutter?',
      [
        'Column',
        'Row',
        'Stack',
        'Flex',
      ]),
  QuizQuestions(
      'Which widget should you use if you need to make a scrollable list of items in Flutter?',
      [
        'ListView()',
        'Container()',
        'TextField()',
        'Column()',
      ])
];
