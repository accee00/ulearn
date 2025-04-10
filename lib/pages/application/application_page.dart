import 'package:app_bloc/common/values/colors.dart';
import 'package:app_bloc/pages/application/bloc/application_bloc.dart';
import 'package:app_bloc/pages/application/widget/application_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        final currentState = state as AppState;
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(currentState.index),
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
                  currentIndex: currentState.index,
                  onTap: (value) {
                    context
                        .read<ApplicationBloc>()
                        .add(UpdateIndexEvent(value));
                  },
                  elevation: 0,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
