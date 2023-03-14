// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/consts/consts.dart';
import 'package:shoparea_app/screen/front_store/components/home_banner/home_banner_content.dart';
import 'package:shoparea_app/size_config.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int currentPage = 0;
  List<String> bannerData = [
    "assets/images/home_banner.png",
    "assets/images/home_banner_2.png",
    "assets/images/home_banner_3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenWidth(173),
          child: Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: bannerData.length,
              itemBuilder: (context, index) => BannerContent(
                image: bannerData[index].toString(),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                bannerData.length, (index) => buildDot(index: index)),
          ),
        )
      ],
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(
        right: 5,
      ),
      height: getProportionateScreenWidth(6),
      width: currentPage == index
          ? getProportionateScreenWidth(20)
          : getProportionateScreenWidth(6),
      decoration: BoxDecoration(
          color: currentPage == index ? cColorPrimary50 : cColorNeutral50,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}