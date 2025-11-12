// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../data/exams.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final String indexNumber;
  const HomeScreen({super.key, required this.indexNumber});

  @override
  Widget build(BuildContext context) {
    final exams = [...kExams]..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $indexNumber'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
        child: ListView.separated(
          itemCount: exams.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final exam = exams[i];
            return ExamCard(
              exam: exam,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExamDetailScreen(exam: exam),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 64,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Icon(Icons.list_alt),
              const SizedBox(width: 8),
              Text(
                'Вкупно испити:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '${exams.length}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              // Quick legend
              _LegendChip(color: Theme.of(context).colorScheme.primary, label: 'Идни'),
              const SizedBox(width: 8),
              _LegendChip(color: Theme.of(context).colorScheme.surfaceVariant, label: 'Поминати', textColor: Theme.of(context).colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

class _LegendChip extends StatelessWidget {
  final Color color;
  final String label;
  final Color? textColor;
  const _LegendChip({required this.color, required this.label, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: color.withOpacity(0.25), borderRadius: BorderRadius.circular(100)),
      child: Text(
        label,
        style: TextStyle(
          color: textColor ?? color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}