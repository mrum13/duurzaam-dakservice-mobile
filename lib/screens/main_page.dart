import 'package:duurzaam_dakservice/common/app_colors.dart';
import 'package:duurzaam_dakservice/cubit/navbar_cubit.dart';
import 'package:duurzaam_dakservice/screens/booking_page.dart';
import 'package:duurzaam_dakservice/screens/contact_page.dart';
import 'package:duurzaam_dakservice/screens/home_page.dart';
import 'package:duurzaam_dakservice/screens/services_page.dart';
import 'package:duurzaam_dakservice/screens/webview_screen.dart';
import 'package:duurzaam_dakservice/widgets/custom_button_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
        Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return ServicesPage();
        case 2:
          return ContactPage();
        case 3:
          return BookingPage();
        case 4:
          return WebViewScreen();
        default:
          return HomePage();
      }
      return HomePage();
    }

    Widget customBottomNavigation() {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.only(bottom: 30, left: 24, right: 24),
            decoration: BoxDecoration(
                color: AppColors.whiteColor, borderRadius: BorderRadius.circular(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonNavigationItem(
                  index: 0,
                  icon: Icons.home,
                ),
                CustomButtonNavigationItem(
                  index: 1,
                  icon: Icons.handyman,
                ),
                CustomButtonNavigationItem(
                  index: 2,
                  icon: Icons.call,
                ),
                CustomButtonNavigationItem(
                  index: 3,
                  icon: Icons.book,
                ),
                CustomButtonNavigationItem(
                  index: 4,
                  icon: Icons.web,
                ),
              ],
            ),
          ));
    }

    return BlocBuilder<NavbarCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: AppColors.grayColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  
  }
}