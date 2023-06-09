// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';
import 'package:shoparea_app/consts/colors.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/screen/search_screen/components/item_listview_product/item_listview_product.dart';

import '../../../size_config.dart';
import '../../details_screen/detail_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isEmptyStateVisible = false;
  bool isListProductVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: kIsWeb
              ? getWebProportionateScreenWidth(84)
              : getProportionateScreenWidth(84),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 10), // changes position of shadow
              ),
            ],
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: (24)),
              child: TextField(
                onChanged: (value) => searchProduct(value),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: cColorPrimary10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: cColorNeutral70),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: cColorError50),
                  ),
                  hintText: 'Mau cari apa?',
                  hintStyle: TextStyle(
                    color: cColorExpired30,
                    fontWeight: FontWeight.w400,
                    fontSize: (12),
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                itemCount: foundProducts.length,
                itemBuilder: (context, index) => ItemListProduct(
                  product: foundProducts[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        product: foundProducts[index],
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isEmptyStateVisible,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/iv_empty_state.png"),
                      CustomText(
                          teks: "Hasil Tidak Ditemukan",
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          teksColor: cColorNeutralBlack50),
                      VerticalSizedBox(height: 8),
                      CustomText(
                        teks: "Coba dengan keyword lain",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        teksColor: cColorExpired50,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  List<Product> foundProducts = [];

  @override
  void initState() {
    foundProducts = products;
    super.initState();
  }

  void searchProduct(String query) {
    List<Product> results = [];
    if (query.isEmpty) {
      results = products;
    } else {
      results = products
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      foundProducts = results;

      // show empty state
      if (results.isEmpty) {
        isEmptyStateVisible = true;
        isListProductVisible = false;
      } else {
        isEmptyStateVisible = false;
        isListProductVisible = true;
      }
    });
  }
}
