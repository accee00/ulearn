import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar homeAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Container(
      child: Row(
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
        ],
      ),
    ),
  );
}
