import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';

class WalletButton extends StatelessWidget {
  WalletButton({Key? key, this.title, this.ontap, this.icon}) : super(key: key);
  String? title;
  VoidCallback? ontap;
  String? icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xff1980FF)),
              borderRadius: BorderRadius.circular(12),
              color: Color(0xff1980FF).withOpacity(0.1)),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon!),
              SizedBox(
                width: 10,
              ),
              Text(
                title!,
                style: MyTextStyle().style5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
