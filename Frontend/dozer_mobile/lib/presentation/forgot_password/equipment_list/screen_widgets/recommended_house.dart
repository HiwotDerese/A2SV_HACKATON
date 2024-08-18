import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/presentation/details_screen.dart/details_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/controllers/construction_controller.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RecommendedHouse extends StatelessWidget {
  final ConstructionMachineController controller = Get.put(ConstructionMachineController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h, // Set a fixed height based on the screen size
      child: Obx(
        () {
          if (controller.status.value == Status.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.status.value == Status.error) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(child: Text('Error loading machines. Please try again.')),
              ],
            );
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen(constructionMachine: controller.recommendedList[index],);
                      },
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 1000, // Adjust the height of the Container
                  margin: EdgeInsets.symmetric(horizontal: 3.w ,vertical: 10.h), // Add margin for spacing between items
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.recommendedList[index].image.isNotEmpty
                                  ?                               controller.recommendedList[index].image[0]
                                  : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/CatD9T.jpg/330px-CatD9T.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: CircleIconButton(
                          iconUrl: 'assets/icons/mark.svg',
                          color: primaryColor,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.white54,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.recommendedList[index].name,
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller.recommendedList[index].location,
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Renters Name: ${controller.recommendedList[index].name}',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Available Amount: ${controller.recommendedList[index].quantity.toString()}',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: controller.recommendedList.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10), // Adjust the width of the separator
            );
          }
        },
      ),
    );
  }
}
