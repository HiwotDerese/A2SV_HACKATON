import 'package:dozer_mobile/core/data/apis/api_response_status.dart';
import 'package:dozer_mobile/core/theme/colors.dart';
import 'package:dozer_mobile/presentation/create_equipment/controllers/create_equipment_controller.dart';
import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateEquipmentScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _pricePerHourController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _capacityController = TextEditingController();
  final _modelController = TextEditingController();
  final _specificationsController = TextEditingController();
  final _transportationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final EquipmentController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Create Equipment', style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextFormField(
                  _nameController, 'Name', controller.validateName),
              _buildTextFormField(_quantityController, 'Quantity',
                  controller.validateQuantity, TextInputType.number),
              _buildTextFormField(_pricePerHourController, 'Price Per Hour',
                  controller.validatePricePerHour, TextInputType.number),
              _buildTextFormField(
                  _locationController, 'Location', controller.validateLocation),
              _buildTextFormField(_descriptionController, 'Description',
                  controller.validateDescription),
              _buildTextFormField(
                  _categoryController, 'Category', controller.validateCategory),
              _buildTextFormField(
                  _capacityController, 'Capacity', controller.validateCapacity),
              _buildTextFormField(
                  _modelController, 'Model', controller.validateModel),
              _buildTextFormField(
                  _specificationsController,
                  'Specifications (comma separated)',
                  controller.validateSpecifications),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.selectedImage.value != null)
                      Center(
                        child: Image.file(
                          controller.selectedImage.value!,
                          height: 200.h,
                          width: 200.w,
                        ),
                      ),
                    SizedBox(height: 10.h),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          await controller.pickImage();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text('Pick Image',
                            style: TextStyle(color: AppColors.white)),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 10.h),
              Obx(() {
                return SwitchListTile(
                  title: Text('Transportation',
                      style: TextStyle(color: AppColors.black)),
                  value: controller.transportation.value,
                  onChanged: (bool value) {
                    controller.transportation.value = value;
                  },
                );
              }),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await controller
                          .uploadImage(); // Upload the image and get the URL

                      final newEquipment = Equipment(
                        name: _nameController.text,
                        quantity: int.parse(_quantityController.text),
                        pricePerHour: int.parse(_pricePerHourController.text),
                        location: _locationController.text,
                        description: _descriptionController.text,
                        category: _categoryController.text,
                        image: [
                          controller.imageUrl.value
                        ], // Use the uploaded image URL
                        capacity: _capacityController.text,
                        model: _modelController.text,
                        specifications: _specificationsController.text
                            .split(',')
                            .map((e) => e.trim())
                            .toList(),
                        transportation: controller.transportation.value,
                      );

                      await controller.createEquipment(newEquipment);
                    } catch (e) {
                      Get.snackbar('Error', 'Failed to upload image: $e');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Obx(() => controller.status.value == Status.loading
                    ? CircularProgressIndicator(
                        color: AppColors.white,
                      ) // Show circular progress indicator when loading
                    : Text(
                        'Create Equipment',
                        style: TextStyle(color: AppColors.white),
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
    TextEditingController controller,
    String labelText,
    String? Function(String) validator, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: AppColors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
        ),
        keyboardType: keyboardType,
        validator: (value) => validator(value!),
      ),
    );
  }
}
