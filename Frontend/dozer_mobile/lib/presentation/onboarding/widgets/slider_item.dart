import 'package:dozer_mobile/dozer_exports.dart';
import 'package:dozer_mobile/presentation/onboarding/constants/constants.dart';
import 'package:dozer_mobile/presentation/onboarding/models/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          sliderArrayList[index].sliderHeading,
          style: TextStyle(
            fontFamily: Constants.POPPINS,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.3,
            color: Color.fromARGB(255, 255, 162, 0),
            fontSize: 18.0,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02,)  , 
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              sliderArrayList[index].sliderSubHeading,
              style: TextStyle(
                fontFamily: Constants.OPEN_SANS,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
                height: 1.1,
                fontSize: 12.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 5.h,),
       Expanded(
  child: ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    ),
    child: Container(
      // height: 10.h,
      // width: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          // fit: BoxFit.cover,
          image: AssetImage(sliderArrayList[index].sliderImageUrl),
        ),
      ),
    ),
  ),
),

      ],
    );
  }
}
