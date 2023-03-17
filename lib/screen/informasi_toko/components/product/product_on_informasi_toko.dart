import 'package:flutter/material.dart';
import 'package:shoparea_app/models/Product.dart';
import 'package:shoparea_app/screen/informasi_toko/components/product/product_card.dart';
import 'package:shoparea_app/size_config.dart';

// ignore: use_key_in_widget_constructors
class ProductOnInformasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                (index) {
                  return ProductCard(product: products[index]);
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}