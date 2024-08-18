import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final bottomBarItem = [
    {'icon': Icons.search, 'route': '/search'},
    {'icon': Icons.monetization_on, 'route': '/bid'},
    {'icon': Icons.devices, 'route': '/all_machines'},
    {'icon': Icons.book, 'route': '/bookings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 80), // Adjusted margin
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: bottomBarItem
                .map(
                  (item) => Material(
                    child: InkWell(
                      onTap: () {
                        // Use GetX for navigation
                        Get.toNamed(item['route'] as String);
                      },
                      child: Icon(
                        item['icon'] as IconData?,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Positioned(
          bottom: 60,
          child: FloatingActionButton(
            onPressed: () {
              // Add functionality for the floating action button
            },
            child: Icon(Icons.add),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
