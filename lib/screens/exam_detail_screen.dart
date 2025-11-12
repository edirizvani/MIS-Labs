// lib/screens/exam_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final statusInfo = _timeDiffLabel(exam.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(exam: exam),
            const SizedBox(height: 16),

            _InfoTile(
              icon: Icons.calendar_today,
              title: 'Датум и време',
              value: exam.dateLabel,
            ),
            const SizedBox(height: 8),
            _InfoTile(
              icon: Icons.meeting_room,
              title: 'Простории',
              value: exam.roomsLabel,
            ),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: exam.isPast ? scheme.surfaceVariant : scheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    exam.isPast ? Icons.history : Icons.hourglass_bottom,
                    color: exam.isPast ? scheme.onSurfaceVariant : scheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      statusInfo,
                      style: TextStyle(
                        color: exam.isPast ? scheme.onSurfaceVariant : scheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
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

  String _timeDiffLabel(DateTime date) {
    final now = DateTime.now();
    Duration diff = date.difference(now);
    final past = diff.isNegative;
    diff = diff.abs();
    final days = diff.inDays;
    final hours = diff.inHours % 24;

    final core = '$days дена, $hours часа';
    if (past) {
      return 'Испитот помина пред $core';
    } else {
      return 'Преостанато време до испитот: $core';
    }
  }
}

class _Header extends StatelessWidget {
  final Exam exam;
  const _Header({required this.exam});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: exam.isPast
              ? [scheme.surfaceVariant, scheme.surfaceVariant.withOpacity(0.6)]
              : [scheme.primary, scheme.primary.withOpacity(0.7)],
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: exam.isPast ? scheme.surface : scheme.onPrimary,
            child: Icon(
              exam.isPast ? Icons.check_circle : Icons.event_available,
              size: 28,
              color: exam.isPast ? scheme.onSurface : scheme.primary,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              exam.subjectName,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: exam.isPast ? scheme.onSurface : scheme.onPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: scheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 4),
                Text(value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}