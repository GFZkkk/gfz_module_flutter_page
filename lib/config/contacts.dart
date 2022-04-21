import 'package:flutter/material.dart';

class AppColors {
  static const col_ff2b2b = Color(0xffFF2B2B);
  static const col_efefef = Color(0xffefefef);
  static const col_2C2E34 = Color(0xff2C2E34);
  static const col_4B4F5A = Color(0xff4B4F5A);
  static const col_F3F3F3 = Color(0xffF3F3F3);
}

class AppStyles {
  static const timeStyle = TextStyle(
    color: Colors.grey,
    fontSize: 12,
  );

  static const nameStyle = TextStyle(
    color: AppColors.col_2C2E34,
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  static const messageStyle = TextStyle(
    color: AppColors.col_4B4F5A,
    fontSize: 12,
  );
}

class Routes {

}

class Constants {

}

class SP{
  static const String CUR_USER = 'CUR_USER_KEY';

  static const String SESSION_LIST = 'U_SESSION_LIST_KEY';

}