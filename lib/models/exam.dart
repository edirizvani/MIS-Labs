class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;

  const Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
  });

  bool get isPast => dateTime.isBefore(DateTime.now());

  String get dateLabel {
    // dd.MM.yyyy, HH:mm
    final d = dateTime;
    final two = (int n) => n.toString().padLeft(2, '0');
    return '${two(d.day)}.${two(d.month)}.${d.year}, ${two(d.hour)}:${two(d.minute)}';
  }

  String get roomsLabel => rooms.join(', ');
}