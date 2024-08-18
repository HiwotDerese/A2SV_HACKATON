import 'package:dozer_mobile/presentation/equipment_list/controllers/recent_bids_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import your controller for recent bids

class RecentBidsWidget extends StatelessWidget {
  final RecentBidsController controller = Get.put(RecentBidsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Recent Bids',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 200.0, // Adjust height as needed
          child: Obx(
            () {
              if (controller.status.value == Status.loading) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.status.value == Status.error) {
                return Center(child: Text('Error loading recent bids. Please try again.'));
              } else {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      // Navigate to details screen when a bid is tapped
                      // Implement your navigation logic here
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Item Name: ${controller.recentBids[index].name}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text('Bid Amount: ${controller.recentBids[index].capacity.toString()}'),
                          SizedBox(height: 8.0),
                          Text('Bidder Name: ${controller.recentBids[index].capacity}'),
                          SizedBox(height: 8.0),
                          Text('Time: ${controller.recentBids[index].createdAt}'),
                        ],
                      ),
                    ),
                  ),
                  itemCount: controller.recentBids.length,
                  separatorBuilder: (BuildContext context, int index) => SizedBox(width: 15.0),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
