import 'package:app_bloc/common/values/colors.dart';
import 'package:app_bloc/pages/welcome/bloc/welcome_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    state.pageIndex = value;
                    BlocProvider.of<WelcomeBloc>(context).add(WelEvent());
                  },
                  children: [
                    _page(
                      context,
                      0,
                      'Next',
                      'First See Learning',
                      'Forget about a for of paper all knowledge in one learning.',
                      'assets/images/reading.png',
                      pageController,
                    ),
                    _page(
                      context,
                      1,
                      'Next',
                      'Connect With Everyone',
                      'Always keep touch with your tutor & friend. Let\'s get connected!',
                      'assets/images/boy.png',
                      pageController,
                    ),
                    _page(
                      context,
                      2,
                      'Get Started',
                      'Always Facinated Learning',
                      'Anywhere, anytime. This time is at our discretion so study whenever you want.',
                      'assets/images/man.png',
                      pageController,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      activeColor: AppColors.primaryThreeElementText,
                      color: AppColors.primarySecondaryElementText,
                      size: const Size.square(8.0),
                      activeSize: const Size(20, 8),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    position: state.pageIndex.toDouble(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _page(
  BuildContext context,
  int index,
  String buttonName,
  String title,
  String subtitle,
  String imgPath,
  PageController pagecontoller,
) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: Image.asset(
          imgPath,
          fit: BoxFit.cover,
        ),
      ),
      Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      Container(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Text(
          subtitle,
          style: TextStyle(
            color: Colors.black.withAlpha(120),
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          if (index < 2) {
            pagecontoller.animateToPage(
              index + 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
            );
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, '/signIn', (route) => false);
          }
        },
        child: Container(
          width: 325.w,
          height: 50.h,
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(100),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ]),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
