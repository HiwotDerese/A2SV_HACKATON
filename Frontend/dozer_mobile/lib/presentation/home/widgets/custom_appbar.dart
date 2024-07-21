import 'package:dozer_mobile/core/language/language_controller.dart';
import 'package:dozer_mobile/presentation/announcement_screen/announcement_screen.dart';
import 'package:dozer_mobile/presentation/user_notification/user_notifcation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String profileImageUrl;

  CustomAppBar({required this.userName, required this.profileImageUrl});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Text(
            'Hello, $userName',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.put(LanguageController()).toggleLanguage();
          },
          icon: SvgPicture.asset(
            'assets/icons/language.svg',
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return NotificationsPage();
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
