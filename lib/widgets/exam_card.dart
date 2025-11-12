// lib/widgets/exam_card.dart
import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;
  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isPast = exam.isPast;
    final scheme = Theme.of(context).colorScheme;

    final Color accent = isPast ? scheme.surfaceVariant : scheme.primary;
    final Color bg = Theme.of(context).brightness == Brightness.dark
        ? scheme.surfaceContainerHighest
        : scheme.surface;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top stripe / gradient header
            Container(
              height: 6,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                gradient: LinearGradient(
                  colors: isPast
                      ? [accent.withOpacity(0.7), accent.withOpacity(0.4)]
                      : [accent, accent.withOpacity(0.6)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: (isPast ? scheme.surfaceVariant : scheme.primaryContainer),
                    child: Icon(
                      isPast ? Icons.check_circle : Icons.school,
                      color: isPast ? scheme.onSurfaceVariant : scheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exam.subjectName,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 16, color: scheme.primary),
                            const SizedBox(width: 6),
                            Text(exam.dateLabel),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.meeting_room, size: 16, color: scheme.secondary),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                exam.roomsLabel,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, size: 26),
                ],
              ),
            ),
            // Footer chips
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isPast ? scheme.surfaceVariant : scheme.primaryContainer,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    isPast ? 'Поминат испит' : 'Иден испит',
                    style: TextStyle(
                      color: isPast ? scheme.onSurfaceVariant : scheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}