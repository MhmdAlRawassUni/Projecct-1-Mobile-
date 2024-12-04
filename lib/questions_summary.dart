import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: summaryData.length,
      itemBuilder: (context, index) {
        return SummaryItem(summaryData[index]);
      },
    );
  }
}

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Card(
      color: const Color(0xFF2A2A3B),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: isCorrectAnswer
                  ? const Color(0xFF1ECB72)
                  : const Color(0xFFF54242),
              child: Text(
                '${(itemData['question_index'] as int) + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemData['question'] as String,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your Answer: ${itemData['user_answer']}',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: isCorrectAnswer
                          ? const Color(0xFF1ECB72)
                          : const Color(0xFFF54242),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Correct Answer: ${itemData['correct_answer']}',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: const Color(0xFF18E8DD),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
