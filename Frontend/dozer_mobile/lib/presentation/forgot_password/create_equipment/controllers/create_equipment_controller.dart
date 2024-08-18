import 'dart:convert';
import 'dart:io';
import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
import 'package:dozer_mobile/presentation/create_equipment/repository/create_equipment_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EquipmentController extends GetxController {
  final EquipmentRepository _equipmentRepository = EquipmentRepository();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController pricePerHourController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController specificationsController = TextEditingController();
  final RxBool transportationController = false.obs;

  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxString imageUrl = ''.obs;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  Future<void> uploadImage() async {
    if (selectedImage.value == null) {
      throw Exception('No image selected');
    }

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dvzsaa0eo/upload');
    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'pfnwlmxn'
      ..fields['folder'] = 'Equipment'
      ..files.add(await http.MultipartFile.fromPath('file', selectedImage.value!.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);
      imageUrl.value = jsonMap['url'];
    } else {
      throw Exception('Failed to upload image');
    }
  }

  Future<void> createEquipment() async {
    try {
      await uploadImage(); // First, upload the image

      final Equipment equipment = Equipment(
        name: nameController.text,
        quantity: int.tryParse(quantityController.text) ?? 0,
        pricePerHour: int.tryParse(pricePerHourController.text) ?? 0,
        location: locationController.text,
        description: descriptionController.text,
        category: categoryController.text,
        image: [imageUrl.value], // Use the uploaded image URL
        capacity: capacityController.text,
        model: modelController.text,
        specifications: specificationsController.text.split(','), // Assuming comma-separated specifications
        transportation: transportationController.value,
      );

      bool success = await _equipmentRepository.createEquipment(equipment);

      if (success) {
        Get.snackbar('Success', 'Equipment created successfully');
      } else {
        Get.snackbar('Error', 'Failed to create equipment');
      }
    } catch (error) {
      print('Error creating equipment: $error');
      Get.snackbar('Error', 'Failed to create equipment');
    }
  }
}
