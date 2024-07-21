import 'dart:convert';
import 'dart:io';
import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
import 'package:dozer_mobile/presentation/create_equipment/repository/create_equipment_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

// enum Status { loading, success, error }

class EquipmentController extends GetxController {
  final EquipmentRepository repository;

  EquipmentController({required this.repository});

  Rx<Status> status = Status.completed.obs;
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxString imageUrl = ''.obs;
  final RxBool transportation = false.obs;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
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
      ..files.add(
          await http.MultipartFile.fromPath('file', selectedImage.value!.path));

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

  Future<void> createEquipment(Equipment newEquipment) async {
    try {
      status(Status.loading);
      print(newEquipment.toJson());
      final success = await repository.createEquipment(newEquipment);
      if (success) {
        status(Status.completed);
        Get.snackbar('Success', 'Equipment created successfully',
            snackPosition: SnackPosition.values[1],
            backgroundColor: AppColors.green,
            colorText: AppColors.white);
        Get.offAllNamed(RoutesName.home);
      } else {
        status(Status.error);
        Get.snackbar('Error', 'Failed to create equipment');
      }
    } catch (e) {
      status(Status.error);
      Get.snackbar('Error', 'Failed to create equipment: $e');
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  String? validateQuantity(String value) {
    if (value.isEmpty) {
      return 'Please enter a quantity';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  String? validatePricePerHour(String value) {
    if (value.isEmpty) {
      return 'Please enter a price per hour';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  String? validateLocation(String value) {
    if (value.isEmpty) {
      return 'Please enter a location';
    }
    return null;
  }

  String? validateDescription(String value) {
    if (value.isEmpty) {
      return 'Please enter a description';
    }
    return null;
  }

  String? validateCategory(String value) {
    if (value.isEmpty) {
      return 'Please enter a category';
    }
    return null;
  }

  String? validateImageUrls(String value) {
    if (value.isEmpty) {
      return 'Please enter image URLs';
    }
    return null;
  }

  String? validateCapacity(String value) {
    if (value.isEmpty) {
      return 'Please enter a capacity';
    }
    return null;
  }

  String? validateModel(String value) {
    if (value.isEmpty) {
      return 'Please enter a model';
    }
    return null;
  }

  String? validateSpecifications(String value) {
    if (value.isEmpty) {
      return 'Please enter specifications';
    }
    return null;
  }
}








// import 'dart:convert';
// import 'dart:io';
// import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
// import 'package:dozer_mobile/presentation/create_equipment/repository/create_equipment_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';


// class EquipmentController extends GetxController {
//   final EquipmentRepository _equipmentRepository = EquipmentRepository();

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController quantityController = TextEditingController();
//   final TextEditingController pricePerHourController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController categoryController = TextEditingController();
//   final TextEditingController imageController = TextEditingController();
//   final TextEditingController capacityController = TextEditingController();
//   final TextEditingController modelController = TextEditingController();
//   final TextEditingController specificationsController = TextEditingController();
//   final RxBool transportationController = false.obs;

//   final Rx<File?> selectedImage = Rx<File?>(null);
//   final RxString imageUrl = ''.obs;

//   Future<void> pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       selectedImage.value = File(pickedFile.path);
//     }
//   }

//   Future<void> uploadImage() async {
//     if (selectedImage.value == null) {
//       throw Exception('No image selected');
//     }

//     final url = Uri.parse('https://api.cloudinary.com/v1_1/dvzsaa0eo/upload');
//     final request = http.MultipartRequest('POST', url)
//       ..fields['upload_preset'] = 'pfnwlmxn'
//       ..fields['folder'] = 'Equipment'
//       ..files.add(await http.MultipartFile.fromPath('file', selectedImage.value!.path));

//     final response = await request.send();
//     if (response.statusCode == 200) {
//       final responseData = await response.stream.toBytes();
//       final responseString = String.fromCharCodes(responseData);
//       final jsonMap = jsonDecode(responseString);
//       imageUrl.value = jsonMap['url'];
//     } else {
//       throw Exception('Failed to upload image');
//     }
//   }

//   Future<void> createEquipment() async {
//     try {
//       await uploadImage(); // First, upload the image

//       final Equipment equipment = Equipment(
//         name: nameController.text,
//         quantity: int.tryParse(quantityController.text) ?? 0,
//         pricePerHour: int.tryParse(pricePerHourController.text) ?? 0,
//         location: locationController.text,
//         description: descriptionController.text,
//         category: categoryController.text,
//         image: [imageUrl.value], // Use the uploaded image URL
//         capacity: capacityController.text,
//         model: modelController.text,
//         specifications: specificationsController.text.split(','), // Assuming comma-separated specifications
//         transportation: transportationController.value,
//       );
//       print(equipment.toJson());
//       bool success = await _equipmentRepository.createEquipment(equipment);

//       if (success) {
//         Get.snackbar('Success', 'Equipment created successfully');
//       } else {
//         Get.snackbar('Error', 'Failed to create equipment');
//       }
//     } catch (error) {
//       print('Error creating equipment: $error');
//       Get.snackbar('Error', 'Failed to create equipment');
//     }
//   }
// }
