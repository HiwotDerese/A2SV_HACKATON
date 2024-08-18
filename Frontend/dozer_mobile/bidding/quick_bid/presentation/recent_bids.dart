import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/login_page.dart';
import 'package:flutter/material.dart';

class RecentBidsColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Bids',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your functionality here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuickBidPage(),
                      ),
                    );
                },
                child: Text('Join by Room ID'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                   foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Adjust the number of cards as needed
            itemBuilder: (BuildContext context, int index) {
              // Dummy data
              String title = 'Construction Site ${index + 1}';
              String roomId = 'Room ID: ${index + 1001}';

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(title),
                          content: Text('Description: This is a construction site for rental purposes.'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                // Add your functionality here
                                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuickBidPage(),
                      ),
                    );
                              },
                              child: Text('Join Room'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 250, // Adjust the width as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                roomId,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
