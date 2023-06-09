// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';

import '../../../../size_config.dart';

class HomeTitleText extends StatelessWidget {
  const HomeTitleText({
    super.key,
    required this.titleText,
    required this.txtButton,
    required this.press,
    required this.titleFontSize,
    required this.btnFontSize,
  });

  final String titleText, txtButton;
  final double titleFontSize, btnFontSize;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          teks: titleText,
          fontSize: kIsWeb
              ? getWebProportionateScreenWidth(titleFontSize)
              : getProportionateScreenWidth(titleFontSize),
          fontWeight: FontWeight.bold,
          teksColor: Colors.black,
        ),
        GestureDetector(
          onTap: press,
          child: CustomText(
            teks: txtButton,
            fontSize: kIsWeb
                ? getWebProportionateScreenWidth(btnFontSize)
                : getProportionateScreenWidth(btnFontSize),
            fontWeight: FontWeight.w400,
            teksColor: cColorPrimary50,
          ),
        )
      ],
    );
  }
}
