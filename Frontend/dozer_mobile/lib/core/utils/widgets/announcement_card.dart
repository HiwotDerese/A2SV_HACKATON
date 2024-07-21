
import 'package:flutter/material.dart';


import 'package:dozer_mobile/dozer_exports.dart';
class AnnouncementCard extends StatelessWidget {

  const AnnouncementCard({required this.title, required this.description, super.key, this.imageUrl});
  final String? imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {


    return Card(
      elevation: 0,
      child: Column(
        children: [
          // Container for the image (added only when imageUrl is not null)
          if (imageUrl != null)
            Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            ),

          // Container for title and description
          Container(
            padding: EdgeInsets.all(2.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                
                ),
                SizedBox(height: 2.h),
                Text(
                  description,
 // Responsive font size using ScreenUtil
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
