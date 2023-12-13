class Event {
  final String name;
  final DateTime date;
  final String description;
  final bool isUpcoming;
  final String imageURL; // Add this line

  Event({
    required this.name,
    required this.date,
    required this.description,
    required this.isUpcoming,
    required this.imageURL, // Add this line
  });
}

List<Event> events = [
  Event(
    name: 'Anti Ragging Poster Making Competetion 2023',
    date: DateTime(2022, 10, 15),
    description: 'A night of music, dance, and cultural celebration.',
    isUpcoming: false,
    imageURL: 'https://firebasestorage.googleapis.com/v0/b/footprints-app-c3790.appspot.com/o/images%2FScreenshot%202023-12-13%20at%207.12.33%E2%80%AFPM.png?alt=media&token=28eb5288-fc62-486f-84fd-be3ea7e3e0dd',
  ),
  Event(
    name: 'Chayan 2024',
    date: DateTime(2023, 3, 20),
    description: 'Recruitment Drive of Team Footprints',
    isUpcoming: true,
    imageURL: 'https://firebasestorage.googleapis.com/v0/b/footprints-app-c3790.appspot.com/o/images%2FScreenshot%202023-12-13%20at%207.12.33%E2%80%AFPM.png?alt=media&token=28eb5288-fc62-486f-84fd-be3ea7e3e0dd',
  ),
  // Add more events as needed
];
