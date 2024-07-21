import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dozer_mobile/dozer_exports.dart';
class ListCardArrowRight extends StatelessWidget {
  const ListCardArrowRight({
    required this.title,
    required this.status,
    required this.data,
    required this.completion,
    super.key,
  });

  final String title;
  final String status;
  final String data;
  final String completion;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle card click
        if (kDebugMode) {
          print('Card Clicked');
        }
      },
      child: Card(
        elevation: 1,
        margin: EdgeInsets.only(top: 0.7.h),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(5), // Adjust the border-radius as needed
        ),
        color: Colors.white,
        // Set the card color to white
        child: Padding(
          padding: EdgeInsets.all(2.0.h),
          child: Row(
            children: [
              // First Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Row
                  Row(
                    children: [
                      Text(
                        title,
                       
                      ),
                      SizedBox(width: 4.0.w),
                      Container(
                        width: 20.0.w,
                        height: 3.0.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            1.h,),  // Adjust the border-radius as needed
                          color: status == 'Completed'
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: Center(
                          child: Text(status),
                        ),
                      ),
                    ],
                  ),
                  // Second Row
                  Container(
                    margin: EdgeInsets.only(top: 2.0.h),
                    child: Row(
                      children: [
                        Text(data,),
                        Container(
                          width: 0.2.w, // Adjust the width of the vertical line
                          height:
                              2.5.h, // Adjust the height of the vertical line
                       // Use a distinct color
                          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                        ),
                        Text(
                          completion,

                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Arrow Icon to the Right
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/right_arrow.svg',
                // Replace with the actual path to your right arrow SVG file
                width: 3.0.w,
                height: 3.0.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
