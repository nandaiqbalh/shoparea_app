// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoparea_app/components/sized_box/vertical_sized_box.dart';
import 'package:shoparea_app/components/teks/custom_teks.dart';

import '../../../../consts/colors.dart';
import '../../../../size_config.dart';

class LokasiTeksWithCounter extends StatefulWidget {
  const LokasiTeksWithCounter({Key? key}) : super(key: key);

  @override
  LokasiTeksWithCounterState createState() => LokasiTeksWithCounterState();
}

class LokasiTeksWithCounterState extends State<LokasiTeksWithCounter> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateCharCount);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateCharCount);
    _controller.dispose();
    super.dispose();
  }

  void _updateCharCount() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              teks: "Catatan (Lokasi)",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              teksColor: cColorNeutralBlack50,
            ),
            CustomText(
              teks: '${_controller.text.length} / 100',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              teksColor: cColorNeutral70,
            ),
          ],
        ),
        VerticalSizedBox(height: 8),
        Container(
          height: kIsWeb
              ? getWebProportionateScreenWidth(84)
              : getProportionateScreenWidth(84),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: TextField(
            controller: _controller,
            maxLength: 100, //
            decoration: InputDecoration(
              counterStyle: TextStyle(
                height: double.minPositive,
              ),
              suffixStyle: TextStyle(
                fontSize: 12,
                height: 1,
              ),
              counter: SizedBox.shrink(),
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
              hintText: 'Cth: Unit, departemen, dll.',
              hintStyle: TextStyle(
                color: cColorExpired30,
                fontWeight: FontWeight.w400,
                fontSize: kIsWeb
                    ? getWebProportionateScreenWidth(12)
                    : getProportionateScreenWidth(12),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
