import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/live_page.dart';
import 'package:flutter/material.dart';

class QuickBidPage extends StatefulWidget {
  const QuickBidPage({Key? key}) : super(key: key);

  @override
  State<QuickBidPage> createState() => _QuickBidPageState();
}

class _QuickBidPageState extends State<QuickBidPage> {
  final usernameController = TextEditingController();
  final roomIdController = TextEditingController();
  bool isHost = false;

  @override
  void dispose() {
    usernameController.dispose();
    roomIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Join Live Audio Bidding Room',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://www.cfisherconstruction.com/wp-content/uploads/2022/03/Tips-For-Commercial-Construction-Bid-Chad-Fisher-Construction.jpg', // Add your network image URL here
                width: double.infinity,
                height: 300,
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'Create or Join a Quick bid',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), // Add rounded border to form
                  border: Border.all(color: Colors.grey), // Add border color
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        contentPadding: EdgeInsets.all(10.0),
                        border: InputBorder.none, // Remove default border
                      ),
                    ),
                    Divider(), // Add a divider between fields
                    TextField(
                      controller: roomIdController,
                      decoration: const InputDecoration(
                        labelText: 'RoomID',
                        contentPadding: EdgeInsets.all(10.0),
                        border: InputBorder.none, // Remove default border
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text('Host ?'),
                  const SizedBox(
                    width: 4,
                  ),
                  Switch(
                    value: isHost,
                    onChanged: (val) {
                      setState(() {
                        isHost = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (isHost) {
                    // If host is on, navigate to create room page
                    // (You'll need to implement this)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LivePage(
                          roomID: roomIdController.text,
                          isHost: isHost,
                          userName: usernameController.text,
                          userId: usernameController.text.replaceAll(' ', '').trim(),
                        );
                      }),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LivePage(
                          roomID: roomIdController.text,
                          isHost: isHost,
                          userName: usernameController.text,
                          userId: usernameController.text.replaceAll(' ', '').trim(),
                        );
                      }),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Add rounded border to button
                  ),
                  backgroundColor : primaryColor,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(400, 50),
                ),
                child: Text(
                  isHost ? 'Create Room' : 'Join Room', // Change text based on isHost value
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
