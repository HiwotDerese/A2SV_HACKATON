import 'dart:io';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dozer_mobile/presentation/add_profile_photo/controllers/pick_image_controller.dart';

class PickImagePage extends StatelessWidget {
  final ProfilePictureController _controller =
      Get.put(ProfilePictureController());

  PickImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Profile Picture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              final imagePath = _controller.imagePath.value;

              return GestureDetector(
                onTap: () {
                  _controller.pickImage();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey, // Placeholder color
                    image: imagePath.isNotEmpty
                        ? DecorationImage(
                            image:
                                FileImage(File(imagePath)), // Load picked image
                            fit: BoxFit.cover,
                          )
                        : null, // If no image is picked, do not display anything
                  ),
                  child: const Center(
                    child: Icon(Icons.add, size: 40, color: Colors.white),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Handle skip for now action
              },
              child: const Text(
                'Skip for now',
                style: TextStyle(
                  color: Colors.blue, // Changed to blue for better visibility
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RoutesName.home); // Navigate to home screen
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
