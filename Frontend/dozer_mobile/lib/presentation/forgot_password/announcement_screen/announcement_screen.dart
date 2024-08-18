import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/core/utils/widgets/announcement_card.dart';
import 'package:dozer_mobile/presentation/announcement_screen/controller/announcement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/core/utils/widgets/announcement_card.dart';
import 'package:dozer_mobile/presentation/announcement_screen/controller/announcement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class AnnouncementScreen extends GetView<AnnouncementController> {
  AnnouncementScreen({super.key});
  final controller = Get.put(AnnouncementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
        backgroundColor: primaryColor,
      ),
      backgroundColor: Colors.amber[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: controller.getUniqueDates().map((date) {
            final announcementsForDate = controller.getAnnouncementsForDate(date);

            final displayDate = (DateTime.now().day == date.day &&
                    DateTime.now().month == date.month &&
                    DateTime.now().year == date.year)
                ? 'Today'
                : DateFormat('dd/MM/yyyy').format(date);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 0.1.h,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 1.0.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w,
                        vertical: 1.0.h,
                      ),
                      child: Text(
                        displayDate,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 0.1.h,
                      ),
                    ),
                  ],
                ),
                ...announcementsForDate.map((announcement) {
                  return Padding(
                    padding: EdgeInsets.all(2.h),
                    child: AnnouncementCard(
                      imageUrl: announcement.imageUrl,
                      title: announcement.title,
                      description: announcement.description,
                      // time: announcement.time,
                    ),
                  );
                }),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
