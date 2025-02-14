import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        height: 1,
        color: Colors.grey.withAlpha(70),
      ),
    ),
    title: Text(
      'Log In',
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
      left: 10.h,
      right: 10.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _reusableIcon('google'),
        _reusableIcon('apple'),
        _reusableIcon('facebook'),
      ],
    ),
  );
}

Widget _reusableIcon(String imgPath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.w,
      width: 40.h,
      child: Image.asset('assets/icons/$imgPath.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withAlpha(140),
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildTextField(
  String hintText,
  String textType,
  String iconName,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: Colors.black),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset(
            'assets/icons/$iconName.png',
          ),
        ),
        SizedBox(
          height: 50.h,
          width: 270.w,
          child: TextField(
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return SizedBox(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot password?",
        style: TextStyle(
          color: Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget buildLogInButtons(String buttonName, String type) {
  return GestureDetector(
    child: Container(
      margin: type == 'login'
          ? EdgeInsets.only(top: 40.h)
          : EdgeInsets.only(top: 10.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
