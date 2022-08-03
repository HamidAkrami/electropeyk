import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ElectroClubAppBar extends StatelessWidget {
  const ElectroClubAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xffF2F2F7), borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(15),
      child: TextField(
        style: MyTextStyle().style12,
        decoration: InputDecoration(
            prefixIcon: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  "assets/icons/search.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(top: 10, right: 10),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)),
            hintText: "...جست و جو",
            hintStyle: MyTextStyle().style16),
        textAlign: TextAlign.right,
      ),
    );
  }
}
