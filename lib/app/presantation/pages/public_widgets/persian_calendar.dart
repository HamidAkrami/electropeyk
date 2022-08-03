import 'package:flutter/material.dart';

import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class PersianCalendar extends StatelessWidget {
  PersianCalendar({Key? key}) : super(key: key);
  Jalali? tempPickedDate;

  @override
  Widget build(BuildContext context) {
    final picked = showPersianDatePicker(
        context: context,
        initialDate: Jalali.now(),
        firstDate: Jalali(1400, 1),
        lastDate: Jalali(1405, 12));

    return Container(
      child: PCupertinoDatePicker(
        mode: PCupertinoDatePickerMode.dateAndTime,
        onDateTimeChanged: (value) {
          tempPickedDate = value;
        },
      ),
    );
  }
}
