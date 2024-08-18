import 'package:dozer_mobile/core/language/language_controller.dart';
import 'package:dozer_mobile/presentation/announcement_screen/announcement_screen.dart';
import 'package:dozer_mobile/presentation/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              // Open the drawer
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Handle language change icon press
                  // Here, you can navigate to a language selection page or toggle between languages
                  // For demonstration, let's call a method from the language controller to change language
                  Get.put(LanguageController()).toggleLanguage();
                },
                icon: SvgPicture.asset(
                  'assets/icons/language.svg',
                ),
              ),
              Text(
                'Language',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  // Handle notification icon press
                  // Navigate to the announcement page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        // Replace 'AnnouncementScreen' with your actual announcement screen widget
                        return AnnouncementScreen();
                      },
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  'assets/icons/notification.svg',
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    '1', // Replace with your notification count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
         
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
