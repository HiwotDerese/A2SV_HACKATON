import 'package:dozer_mobile/presentation/onboarding/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  final String skipBtn;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading,
      required this.skipBtn});
}

final sliderArrayList = [
    Slider(
        sliderImageUrl: 'assets/images/dozer.jpg',
        sliderHeading: Constants.SLIDER_HEADING_1,
        sliderSubHeading: Constants.SLIDER_DESC1,
        skipBtn: Constants.SKIP),                                                
    Slider(
        sliderImageUrl: 'assets/images/choose.jpg',
        sliderHeading: Constants.SLIDER_HEADING_2,
        sliderSubHeading: Constants.SLIDER_DESC1,
        skipBtn: Constants.SKIP),
    Slider(
        sliderImageUrl: 'assets/images/book.jpg',
        sliderHeading: Constants.SLIDER_HEADING_3,
        sliderSubHeading: Constants.SLIDER_DESC1,
        skipBtn: ""),
         Slider(
        sliderImageUrl: 'assets/images/dozer.jpg',
        sliderHeading: Constants.SLIDER_HEADING_4,
        sliderSubHeading: Constants.SLIDER_DESC4,
        skipBtn: ""),
          Slider(
        sliderImageUrl: 'assets/images/renter.jpg',
        sliderHeading: Constants.SLIDER_HEADING_5,
        sliderSubHeading: Constants.SLIDER_DESC1,
        skipBtn: ""),
          Slider(
        sliderImageUrl: 'assets/images/book.jpg',
        sliderHeading: Constants.SLIDER_HEADING_6,
        sliderSubHeading: Constants.SLIDER_DESC1,
        skipBtn: ""),
  ];
