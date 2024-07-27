import 'package:flutter/material.dart';
import 'package:marckit/core/utils/builder_app_bar.dart';
import 'package:marckit/fetchars/Ice_cream/ice_cream_view.dart';
import 'package:marckit/fetchars/cold_drinks/cold_drinks_view.dart';
import 'package:marckit/fetchars/home/widgets/custom_tab_bar_body.dart';
import 'package:marckit/fetchars/donut_rings/donut_rings_view.dart';
import 'package:marckit/fetchars/hot_drinks/hot_drinks_view.dart';

import '../../donut_balls/donut_balls_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: buildAppBar(
          title:   
           "Dount Delights",
          bottom: const CustomTabBarBody(),
        ),
        body: const TabBarView(children: [
          DonutRingsView(),
          DonutBallsView(),
          IceCreamView(),
          HotDrinksView(),
          ColdDrinksView(),
        ]),
      ),
    );
  }
}
