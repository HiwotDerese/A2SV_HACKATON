import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/presentation/booking/booking_form.dart';
import 'package:dozer_mobile/presentation/booking/controllers/booking_controller.dart';
import 'package:dozer_mobile/dozer_exports.dart';

import 'package:flutter/material.dart';
import 'package:dozer_mobile/presentation/equipment_list/models/construction_machine.dart';
import 'package:get/get.dart';


class DetailScreen extends StatelessWidget {
  final ConstructionMachineModel constructionMachine;

  DetailScreen({required this.constructionMachine});
final controller = Get.put(BookingController());
  // Function to show reviews popup
  void _showReviewsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reviews'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                // Display comments from different renters here
                // You can fetch this data from your backend or use a predefined list
                Text('Comment 1'),
                Text('Comment 2'),
                Text('Comment 3'),
                // Add more comments as needed
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Construction Details', style: TextStyle()),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(constructionMachine.image[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(1.0.h),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 65, 63, 63).withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Category: ${constructionMachine.category}',
                          style: TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              constructionMachine.name,
                              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price per Hour:',
                                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${constructionMachine.pricePerHour} Br',
                                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Call function to show reviews popup
                                    _showReviewsPopup(context);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '5.0',
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      SizedBox(width: 1.w),
                                      Icon(Icons.star, color: Colors.amber, size: 20),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 4),
                                TextButton(
                                  onPressed: () {
                                    // Call function to show reviews popup
                                    _showReviewsPopup(context);
                                  },
                                  child: Text('4 Reviews >',style: TextStyle(color: Colors.black),),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        // ... rest of the code remains the same
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                   color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Description: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    '${constructionMachine.description}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                             SizedBox(height: 2.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                     color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Specifications:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                ...constructionMachine.specifications
                                    .map(
                                      (specification) => Container(
                                        margin: EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          '• $specification',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h,),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Capacity : ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    '${constructionMachine.capacity}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Model : ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    '${constructionMachine.model}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Location: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    '${constructionMachine.location}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Available Amount : ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                '${constructionMachine.quantity}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                       
                        SizedBox(height: 2.h),
                        if (constructionMachine.transportation != null)
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Free Transportation: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${constructionMachine.transportation ? 'Yes' : 'No'}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: constructionMachine.transportation ? Colors.green : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle booking 
              Get.to(BookingForm(equipmentId:constructionMachine.id,availability:constructionMachine.quantity,equipmentName: constructionMachine.name,imageUrl: constructionMachine.image[0],));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(70.w, 50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Book',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Icon(Icons.arrow_downward, color: Colors.grey),
        ],
      ),
    );
  }
}
