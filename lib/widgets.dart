import 'package:flutter/material.dart';
import 'package:foodcommerce/constants.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final double textsize = 10;
  final double iconsize = 15;
  const IconTextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconsize,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(fontSize: textsize, color: Appcolors.paraColor),
        ),
      ],
    );
  }
}

class BigText extends StatelessWidget {
  final Color color;
  final double size;
  final String text;
  final TextOverflow overflow;
  const BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 20,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
        fontSize: size,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final Color color;
  final double size;
  final String text;
  final double height;

  const SmallText({
    Key? key,
    this.color = const Color(0xFF8f837f),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
      ),
    );
  }
}
