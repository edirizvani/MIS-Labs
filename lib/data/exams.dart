// lib/data/exams.dart
import '../models/exam.dart';

final List<Exam> kExams = [
  Exam(subjectName: 'Математика 1', dateTime: DateTime(2026, 1, 15, 10, 0), rooms: ['А1', 'А2']),
  Exam(subjectName: 'Програмски јазици', dateTime: DateTime(2026, 1, 18, 9, 0), rooms: ['Лаб 3']),
  Exam(subjectName: 'Алгоритми и структури на податоци', dateTime: DateTime(2025, 1, 20, 12, 0), rooms: ['Амфитеатар']),
  Exam(subjectName: 'Бази на податоци', dateTime: DateTime(2026, 1, 22, 11, 0), rooms: ['Б1']),
  Exam(subjectName: 'Оперативни системи', dateTime: DateTime(2026, 1, 24, 9, 30), rooms: ['Лаб 1', 'Лаб 2']),
  Exam(subjectName: 'Компјутерски мрежи', dateTime: DateTime(2026, 1, 26, 13, 0), rooms: ['Б2']),
  Exam(subjectName: 'Веб програмирање', dateTime: DateTime(2026, 1, 28, 10, 0), rooms: ['Лаб 5']),
  Exam(subjectName: 'Мобилни апликации', dateTime: DateTime(2025, 1, 30, 12, 30), rooms: ['Лаб 6']),
  Exam(subjectName: 'Информациски системи', dateTime: DateTime(2025, 2, 1, 9, 0), rooms: ['Амфитеатар']),
  Exam(subjectName: 'Етичко хакерство', dateTime: DateTime(2025, 2, 3, 14, 0), rooms: ['Б3']),
  Exam(subjectName: 'Дискретна математика', dateTime: DateTime(2024, 12, 20, 10, 0), rooms: ['А3']),
];