class Event {
  final String name;
  final DateTime date;
  final String description;
  final bool isUpcoming;

  Event({
    required this.name,
    required this.date,
    required this.description,
    required this.isUpcoming,
  });
}


List<Event> events = [
  Event(
    name: 'Cultural Night 2022',
    date: DateTime(2022, 10, 15),
    description: 'A night of music, dance, and cultural celebration.',
    isUpcoming: false,
  ),
  Event(
    name: 'Spring Festival 2023',
    date: DateTime(2023, 3, 20),
    description: 'Celebrate the arrival of spring with various activities.',
    isUpcoming: true,
  ),
  // Add more events as needed
];
