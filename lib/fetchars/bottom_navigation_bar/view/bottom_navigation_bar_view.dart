import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marckit/fetchars/bottom_navigation_bar/controllers/navigation_crl.dart';
import 'package:marckit/fetchars/bottom_navigation_bar/view/widgets/tab_navigation_pages.dart';

import '../../../../core/constants/app_colors.dart';

class CustomCurvedNavigationBar extends StatelessWidget {
  const CustomCurvedNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationCrl>(
      init: NavigationCrl(),
      builder: (navcrl) {
        return Scaffold(
          body: Stack(
            children: [
              _buildoffStageNavigator(navcrl, "page1"),
              _buildoffStageNavigator(navcrl, "page2"),
              _buildoffStageNavigator(navcrl, "page3"),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            color: AppColors.red,
            backgroundColor: AppColors.white.withOpacity(0.2),
            animationDuration: const Duration(milliseconds: 200),
            items: const [
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                size: 30,
                color: Colors.white,
              ),
            ],
            index: navcrl.selectIndex,
            onTap: (index) {
              navcrl.selectTap(navcrl.pageKeysList[index], index);
            },
          ),
        );
      },
    );
  }
}

Widget _buildoffStageNavigator(NavigationCrl navcrl, String tabItem) {
  return Offstage(
    offstage: navcrl.currentPage != tabItem,
    child: TabNavigationPages(
      navigatorKey: navcrl.navigationKeys[tabItem]!,
      tabItem: tabItem,
    ),
  );
}
