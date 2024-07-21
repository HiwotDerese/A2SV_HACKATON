// ignore_for_file: inference_failure_on_instance_creation
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dozer_mobile/dozer_exports.dart';
class LocationCard extends StatelessWidget {
   const LocationCard({
    required this.date,
    required this.location,
    required this.numberOfAssessments,
    required this.type,


    super.key,
  });
  final String date;
  final String location;
  final dynamic numberOfAssessments;
  final String type;
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the LocationChoiceScreen when pressed
       // ignore: inference_failure_on_function_invocation
       if (type == 'checklist'){
       // ignore: inference_failure_on_function_invocation
      //  Get.toNamed(RoutesName.checklistLocationchoice);
       }
       else{
// ignore: inference_failure_on_function_invocation
// Get.toNamed(RoutesName.locationChoicecreen);
       }
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 2.h),
        
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You are working on ',
             
              ),
              SizedBox(height: 1.h),
              Container(
                padding: EdgeInsets.all(1.w),
                width: 90.w,
                height: 10.h,
                decoration: BoxDecoration(
                  border: Border.all(
                  
                    width: 0.1.w,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              ' $location',

                            ),
                            SizedBox(width: 2.w),
                            SvgPicture.asset(
                              'assets/icons/switch_location.svg',
                              width: 3.w,
                              height: 3.h,
                            ),
                          ],
                        ),
                        PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem(
                                child: Text('Summary'),
                              ),
                              const PopupMenuItem(
                                child: Text('History'),
                              ),
                              const PopupMenuItem(
                                child: Text('Actions'),
                              ),
                              const PopupMenuItem(
                                child: Text('Comments'),
                              ),
                              const PopupMenuItem(
                                child: Text('Skips'),
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(date),
                        Container(
                          width: 0.2.w,
                          height: 2.5.h,
                          
                          margin: EdgeInsets.symmetric(horizontal: 3.0.w),
                        ),
                        Text(
                          '$numberOfAssessments',
                         
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
