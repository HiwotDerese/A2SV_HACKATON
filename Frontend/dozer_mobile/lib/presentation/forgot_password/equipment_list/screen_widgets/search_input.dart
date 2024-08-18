import 'package:dozer_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedFilters = <String>{}.obs;

  void toggleFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }
}

class SearchInput extends StatelessWidget {
  final FilterController filterController = Get.put(FilterController());

  final List<String> filterOptions = List.generate(20, (index) => 'Option $index');
  final List<String> locationOptions = List.generate(20, (index) => 'Location $index');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
  'assets/icons/filter_icon.svg',
  width: 24,
  height: 24,
  color: Colors.black, // Change color if needed
),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Select Filters'),
                          content: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildFilterSection('Categories', filterOptions),
                                  SizedBox(height: 16.0),
                                  _buildFilterSection('Locations', locationOptions),
                                ],
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ), backgroundColor: primaryColor,
                              ),
                              child: Text(
                                'Apply',
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                // Apply selected filters here
                                Navigator.of(context).pop();
                                print(filterController.selectedFilters);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 200.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                return Obx(
                  () => CheckboxListTile(
                    title: Text(option),
                    value: filterController.selectedFilters.contains(option),
                    onChanged: (bool? value) {
                      filterController.toggleFilter(option);
                    },
                    activeColor: primaryColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
