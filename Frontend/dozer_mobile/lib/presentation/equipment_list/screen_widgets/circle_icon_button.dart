import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleIconButton extends StatelessWidget {
  final String iconUrl;
  final Color color;
  final VoidCallback? onPressed;

  CircleIconButton({
    required this.iconUrl,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: CircleBorder(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconUrl,
            color: Colors.white,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }
}
