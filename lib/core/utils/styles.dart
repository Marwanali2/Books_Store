import 'package:flutter/material.dart';

import '../../constants.dart';

// بنلف علي كل تيكست في الديزان و نجمعهم علي حسب الحجم بتاعهم
// الفونت فاميلي بتبقي اساية للابب كلو لكن لو عندي تيكست مختلف هكتبله الفاميلي بتاعته في ملف الكونستانت و بعمل copy with

abstract class TextStyles {
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700, //bold
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, //medium
  );

  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    //fontFamily: kQuicksand,
  );

  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    fontFamily: kQuicksand,
  );
}

abstract class ColorStyles {
  static const kPrimaryColor = Color(0xff100B20);
  static const kGreyColor = Color(0xff707070);
}
