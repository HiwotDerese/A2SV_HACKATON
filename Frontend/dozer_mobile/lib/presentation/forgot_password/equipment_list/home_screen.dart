import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dozer_mobile/core/routes/routes_name.dart';
import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/login_page.dart';
import 'package:dozer_mobile/presentation/bidding/quick_bid/presentation/recent_bids.dart';
import 'package:dozer_mobile/presentation/equipment_list/all_equipments_screen.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/categories_widget.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/custom_appbar.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/recent_bids.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/recommended_house.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/search_input.dart';
import 'package:dozer_mobile/presentation/equipment_list/screen_widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: CustomAppBar(),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeText(),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0, right : 5.0,),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: SearchInput()),
                  ),
                  
                  CategoriesWidget(),
                          
                    Container(
                      height: 300.h,
                      child: RecommendedHouse()),
                  // RecentBidsWidget()
                  RecentBidsColumn()
                ],
              ),
            ),
            // EquipmentListPage(),
          ],
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          backgroundColor: primaryColor,
          overlayColor: Colors.transparent,
          children: [
            SpeedDialChild(
              child: Icon(Icons.garage_outlined),
              backgroundColor: primaryColor,
              label: 'Add Equipment',
              onTap: () {
                Get.offNamed(RoutesName.createEquipment);
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.gavel_rounded,),
              backgroundColor: primaryColor,
              label: 'Create Bid',
              onTap: () {
                // Handle create bid action
                 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuickBidPage()),
    );
              },
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: Colors.white,
          activeColor: primaryColor, // Customize the active color
          color: Colors.grey, // Customize the inactive color
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.garage_outlined, title: 'All Equipment'),
            TabItem(icon: Icons.book, title: 'Bookings'),
            TabItem(icon: Icons.gavel, title: 'Bid'),
          ],
          initialActiveIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
