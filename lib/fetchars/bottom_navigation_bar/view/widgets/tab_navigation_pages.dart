import 'package:flutter/material.dart';
import 'package:marckit/fetchars/cart/shopping_cart/view/cart_view.dart';
import 'package:marckit/fetchars/settings/view/setting_view.dart';

import '../../../home/view/course_content_view.dart';

class TabNavigationPages extends StatelessWidget {
  const TabNavigationPages(
      {super.key, required this.tabItem, required this.navigatorKey});
  final String tabItem;
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (tabItem == "page1") {
      child = const HomeView();
    } else if (tabItem == "page2") {
      child = const CartView();
    } else if (tabItem == "page3") {
      child = const SettingView();
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (_) => child!);
      },
    );
  }
}
