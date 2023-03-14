// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/size_config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.press,
    required this.button_width,
  });
  final String text;
  final Function()? press;

  final double button_width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: button_width,
      height: getProportionateScreenHeight(48),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
            backgroundColor: cColorPrimary50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(14),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
