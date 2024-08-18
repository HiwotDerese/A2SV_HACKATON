import 'package:dozer_mobile/presentation/create_equipment/controllers/create_equipment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEquipmentScreen extends StatelessWidget {
  final EquipmentController equipmentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Equipment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: equipmentController.nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: equipmentController.quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: equipmentController.pricePerHourController,
                decoration: InputDecoration(
                  labelText: 'Price Per Hour',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: equipmentController.locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: equipmentController.descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 10),
              TextField(
                controller: equipmentController.categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: equipmentController.capacityController,
                decoration: InputDecoration(
                  labelText: 'Capacity',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: equipmentController.modelController,
                decoration: InputDecoration(
                  labelText: 'Model',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: equipmentController.specificationsController,
                decoration: InputDecoration(
                  labelText: 'Specifications (comma-separated)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (equipmentController.selectedImage.value != null)
                      Image.file(
                        equipmentController.selectedImage.value!,
                        height: 200,
                        width: 200,
                      ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        await equipmentController.pickImage();
                      },
                      child: Text('Pick Image'),
                    ),
                  ],
                );
              }),
              SizedBox(height: 10),
              Obx(() => SwitchListTile(
                title: Text('Transportation'),
                value: equipmentController.transportationController.value,
                onChanged: (value) {
                  equipmentController.transportationController.value = value;
                },
              )),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await equipmentController.createEquipment();
                  },
                  child: Text('Create Equipment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
