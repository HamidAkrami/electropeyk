import 'package:electropeyk/app/presantation/routes/app_routes.dart';
import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
      required this.title,
      required this.iconUrl,
      this.ontap,
      this.enable = true})
      : super(key: key);

  final String? title;
  final String? iconUrl;
  final ValueChanged? ontap;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xff1980FF).withOpacity(enable ? 1 : 0.4), width: 1),
          borderRadius: BorderRadius.circular(8),
          color: Color(0xff1980FF).withOpacity(0.1)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color(0xff1980FF).withOpacity(enable ? 1 : 0.4)),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                iconUrl!,
                color: Color(0xff1980FF).withOpacity(enable ? 1 : 0.4),
              )
            ],
          ),
        ),
      ),
    );
  }
}
