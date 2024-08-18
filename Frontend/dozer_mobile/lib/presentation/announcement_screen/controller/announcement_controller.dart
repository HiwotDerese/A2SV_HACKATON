import 'package:dozer_mobile/core/dummy_data.dart';
import 'package:dozer_mobile/presentation/announcement_screen/models/announcement_model.dart';
import 'package:get/get.dart';

class AnnouncementController extends GetxController {
  RxList<AnnouncementModel> announcements = <AnnouncementModel>[].obs;

  @override
  void onInit() {
    super.onInit(); // Don't forget to call super.onInit()
    
    // Simulate fetching data from the server
    fetchAnnouncements();
  }

  void fetchAnnouncements() {
    // Simulated data - replace with actual data retrieval logic
    final dummyData = DummyData.getAnnouncementData();

    announcements.assignAll(dummyData);
  }

  // Method to add announcements
  void addAnnouncement(AnnouncementModel announcement) {
    announcements.add(announcement);
  }

  // Method to get unique dates from announcements
  List<DateTime> getUniqueDates() {
    return announcements
        .map((announcement) => announcement.date)
        .toSet()
        .toList();
  }

  // Method to get announcements for a specific date
  List<AnnouncementModel> getAnnouncementsForDate(DateTime date) {
    return announcements
        .where((announcement) => announcement.date == date)
        .toList();
  }
}
