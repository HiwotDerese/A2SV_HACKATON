import 'package:dozer_mobile/presentation/onboarding/ui_views/intro_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  int _activePage = 0;

  void onNextPage() {
    if (_activePage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'color': '#FFE8900D',
      'title': 'WELCOME TO DOZER',
      'image': 'assets/images/AdobeStock_5975972_Preview.jpeg',
      'description':
          "Construction and Heavy Machinery Rental App. Streamline your construction projects with Dozer.",
      'skip': true
    },
    {
      'color': '#FFE8900D',
      'title': 'Simplify Equipment Rentals',
      'image': 'assets/images/AdobeStock_190729345_Preview.jpeg',
      'description':
          'Connect with equipment owners and find the machinery you need effortlessly.',
      'skip': true
    },
    {
      'color': '#FFE8900D',
      'title': 'Bid for the Best Equipment Deals',
      'image': 'assets/images/AdobeStock_432198200_Preview.jpeg',
      'description':
          'Secure the best prices for your construction needs through Dozer\'s seamless bidding feature.',
      'skip': true
    },
    {
      'color': '#FFE8900D',
      'title': 'Maximize Machinery Utilization',
      'image': 'assets/images/AdobeStock_43824441_Preview.jpeg',
      'description':
          'Join Dozer to ensure your machinery is always in use and generating value.',
      'skip': false
    },
  ];

  @override
  Widget build(BuildContext context) {
  print('***************************************************************************************');
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              scrollBehavior: AppScrollBehavior(),
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return IntroWidget(
                  index: index,
                  color: _pages[index]['color'],
                  title: _pages[index]['title'],
                  description: _pages[index]['description'],
                  image: _pages[index]['image'],
                  skip: _pages[index]['skip'],
                  onTab: onNextPage,
                );
              }),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicator())
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];

    for (var i = 0; i < _pages.length; i++) {
      if (_activePage == i) {
        indicators.add(_indicatorsTrue());
      } else {
        indicators.add(_indicatorsFalse());
      }
    }
    return indicators;
  }

  Widget _indicatorsTrue() {
    final String color;
    if (_activePage == 0) {
      color = '#FFE8900D';
    } else if (_activePage == 1) {
      color = '#FFE8900D';
    } else {
      color = '#FFE8900D';
    }

    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 6,
      width: 42,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: hexToColor(color),
      ),
    );
  }

  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color.fromARGB(255, 213, 209, 209),
      ),
    );
  }
}
