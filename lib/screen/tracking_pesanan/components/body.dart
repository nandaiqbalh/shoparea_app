// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/button_style/outlined_button_50.dart';
import 'package:shoparea_app/components/sized_box/horizontal_sized_box.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';

import '../../../consts/colors.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/tracking_kurir.png",
                      ),
                      HorizontalSizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            teks: "Nama Ekspedisi",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            teksColor: cColorNeutralBlack50,
                          ),
                          VerticalSizedBox(height: 8),
                          CustomText(
                            teks: "No. Resi: 087128123123",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            teksColor: cColorExpired50,
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: cColorPrimary50,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "Salin No. Resi",
                          style: TextStyle(
                            fontSize: kIsWeb
                                ? getWebProportionateScreenWidth(10)
                                : getProportionateScreenWidth(10),
                            fontWeight: FontWeight.w600,
                            color: cColorPrimary50,
                          ),
                        ),
                      ),
                    ],
                  ),
                  VerticalSizedBox(height: 24),
                  Divider(
                    color: cColorNeutral30,
                    thickness: 1,
                  ),
                  VerticalSizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        timelineRow(
                          "Pesanan telah dibuat oleh toko",
                          "Pesanan Anda dalam proses pembuatan oleh toko",
                          "16 Agus 2020 - 22.30 PM",
                        ),
                        timelineRow(
                          "Pesanan telah dibuat oleh toko",
                          "Pesanan Anda dalam proses pembuatan oleh toko",
                          "16 Agus 2020 - 22.30 PM",
                        ),
                        timelineRow(
                          "Pesanan telah dibuat oleh toko",
                          "Pesanan Anda dalam proses pembuatan oleh toko",
                          "16 Agus 2020 - 22.30 PM",
                        ),
                        timelineRow(
                          "Pesanan telah dibuat oleh toko",
                          "Pesanan Anda dalam proses pembuatan oleh toko",
                          "16 Agus 2020 - 22.30 PM",
                        ),
                        timelineLastRow("Order Delivered", "", ""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(),
        VerticalSizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: OutlinedButton50(
            text: "Pesanan Telah Diterima",
            press: () {},
            width: double.infinity,
            height: 32,
          ),
        ),
        VerticalSizedBox(height: 24),
      ],
    );
  }

  Widget timelineRow(String title, String subTile, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: kIsWeb
                    ? getWebProportionateScreenWidth(18)
                    : getProportionateScreenWidth(18),
                height: kIsWeb
                    ? getWebProportionateScreenWidth(18)
                    : getProportionateScreenWidth(18),
                decoration: BoxDecoration(
                  color: cColorPrimary50,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: cColorNeutral50,
                    width: 2,
                  ),
                ),
                child: Text(""),
              ),
              Container(
                width: kIsWeb
                    ? getWebProportionateScreenWidth(3)
                    : getProportionateScreenWidth(3),
                height: kIsWeb
                    ? getWebProportionateScreenWidth(68)
                    : getProportionateScreenWidth(68),
                decoration: BoxDecoration(
                  color: cColorNeutral50,
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              CustomText(
                teks: "$title",
                fontSize: 14,
                fontWeight: FontWeight.w700,
                teksColor: cColorNeutralBlack50,
              ),
              VerticalSizedBox(height: 8),
              CustomText(
                teks: "$subTile",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                teksColor: cColorExpired50,
              ),
              VerticalSizedBox(height: 4),
              CustomText(
                teks: "$time",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                teksColor: cColorExpired50,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget timelineLastRow(String title, String subTile, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: kIsWeb
                    ? getWebProportionateScreenWidth(18)
                    : getProportionateScreenWidth(18),
                height: kIsWeb
                    ? getWebProportionateScreenWidth(18)
                    : getProportionateScreenWidth(18),
                decoration: BoxDecoration(
                  color: cColorPrimary50,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: cColorNeutral50,
                    width: 2,
                  ),
                ),
                child: Text(""),
              ),
              Container(
                width: kIsWeb
                    ? getWebProportionateScreenWidth(3)
                    : getProportionateScreenWidth(3),
                height: kIsWeb
                    ? getWebProportionateScreenWidth(20)
                    : getProportionateScreenWidth(20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                ),
                child: Text(""),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                teks: "$title",
                fontSize: 14,
                fontWeight: FontWeight.w700,
                teksColor: cColorNeutralBlack50,
              ),
              VerticalSizedBox(height: 8),
              CustomText(
                teks: "$subTile",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                teksColor: cColorExpired50,
              ),
              VerticalSizedBox(height: 4),
              CustomText(
                teks: "$time",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                teksColor: cColorExpired50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
