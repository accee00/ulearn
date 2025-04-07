import 'package:app_bloc/common/values/colors.dart';
import 'package:app_bloc/pages/application/widget/application_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(index),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 58.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.h),
                topLeft: Radius.circular(20.h),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
              currentIndex: index,
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/home.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/home.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'search',
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/search2.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/search2.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'courses',
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/play-circle1.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/message-circle.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'msg',
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/message-circle.png"),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'profile',
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/person2.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/person2.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
