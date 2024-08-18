import 'package:dozer_mobile/presentation/details_screen.dart/details_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/controllers/construction_controller.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/circle_icon_button.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dozer_mobile/dozer_exports.dart';

class EquipmentListPage extends StatelessWidget {
  final ConstructionMachineController controller = Get.put(ConstructionMachineController());

  EquipmentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Categories List
          Padding(
           padding: const EdgeInsets.all(8.0),
           child: SearchInput(),
         ),
          Container(
            height: 70, // Increased height
            child: Obx(
              () {
                if (controller.status.value == Status.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.status.value == Status.error) {
                  return Text('Error loading categories. Please try again.');
                } else {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      
                      SectionContainer(
                        sectionName: "CompactEquipment",
                        initialSelected: true,
                        onPressed: () {
                          controller.loadRecommendedMachinesbyCategory("CompactEquipment");
                        },
                      ),
                      SectionContainer(
                        sectionName: "HeavyEarthmoving",
                        initialSelected: false,
                        onPressed: () {
                          controller.loadRecommendedMachinesbyCategory("HeavyEarthmoving");
                        },
                      ),
                      SectionContainer(
                        sectionName: "LiftAerialWorkPlatform",
                        initialSelected: false,
                        onPressed: () {
                          controller.loadRecommendedMachinesbyCategory("LiftAerialWorkPlatform");
                        },
                      ),
                      SectionContainer(
                        sectionName: "RollersCompaction",
                        initialSelected: false,
                        onPressed: () {
                          controller.loadRecommendedMachinesbyCategory("RollersCompaction");
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ),

          // Search Bar
         
          SizedBox(height: 10),

          // Equipment List
          Expanded(
            child: Obx(
              () {
                if (controller.status.value == Status.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.status.value == Status.error) {
                  return Center(child: Text('Error loading machines. Please try again.'));
                } else {
                  return ListView.builder(
                    itemCount: controller.categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final constructionMachine = controller.categoryList[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailScreen(constructionMachine: constructionMachine);
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              // Image loading without a placeholder
                              if (constructionMachine.image.isNotEmpty)
                                Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(constructionMachine.image[0]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: CircleIconButton(
                                  iconUrl: 'assets/icons/mark.svg',
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.white54,
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        constructionMachine.name,
                                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        constructionMachine.location,
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        'Renters Name: ${constructionMachine.name}',
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        'Available Amount: ${constructionMachine.quantity.toString()}',
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  final String sectionName;
  final RxBool isSelected; // Using RxBool for observability
  final VoidCallback onPressed;

  SectionContainer({
    required this.sectionName,
    required bool initialSelected, // Use a regular bool for the initial value
    required this.onPressed,
  }) : isSelected = initialSelected.obs; // Convert to RxBool

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Obx(
        () => Container(
          margin: EdgeInsets.all(12.0), // Increased margin
          padding: EdgeInsets.all(16.0), // Increased padding
          decoration: BoxDecoration(
            color: isSelected.value ? Color.fromARGB(255, 52, 53, 53) : Colors.white,
            borderRadius: BorderRadius.circular(12.0), // Increased border radius
          ),
          child: Text(
            sectionName,
            style: TextStyle(
              color: isSelected.value ? Colors.white : Colors.black,
              fontWeight: isSelected.value ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
