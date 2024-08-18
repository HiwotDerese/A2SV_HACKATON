class AnnouncementModel {
  AnnouncementModel({
    required this.title,
    required this.description,
    required this.date,
    this.imageUrl,
    this.time,
  });

  final String? imageUrl;
  final String title;
  final String description;
  final DateTime date;
  final String? time;
}
