import 'package:electropeyk/app/presantation/theme/text_style.dart';
import 'package:flutter/material.dart';

class BottomNavigationItems extends StatelessWidget {
  String? icon;
  String? title;
  int? index;
  int? selectedIndex;
  ValueChanged<int>? ontap;
  BottomNavigationItems(
      {Key? key,
      this.icon,
      this.title,
      this.index,
      this.ontap,
      this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap!(index!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(icon!,
              color: selectedIndex == index
                  ? Color(0xff1980FF)
                  : Color(0xff15171A).withOpacity(0.5)),
          SizedBox(
            height: 2,
          ),
          Text(
            title!,
            style: selectedIndex == index
                ? MyTextStyle().style15
                : MyTextStyle().style14,
          )
        ],
      ),
    );
  }
}
