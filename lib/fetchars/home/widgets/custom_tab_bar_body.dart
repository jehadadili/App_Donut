import 'package:flutter/material.dart';
import 'package:marckit/core/constants/app_colors.dart';
import 'package:marckit/core/constants/assets_data.dart';

class CustomTabBarBody extends StatefulWidget implements PreferredSizeWidget {
  const CustomTabBarBody({
    super.key,
  });

  @override
  State<CustomTabBarBody> createState() => _CustomTabBarBodyState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomTabBarBodyState extends State<CustomTabBarBody> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      unselectedLabelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: const Color(0xffA2A1A4),
      labelStyle: TextStyle(
        color: AppColors.lightpink,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      labelColor: AppColors.lightpink,
      tabs: [
        Tab(
          height: 70,
          child: Column(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(AssetsData.vector),
              ),
              const Text('Donut rings'),
            ],
          ),
        ),
        Tab(
          height: 70,
          child: Column(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBbdcD4Wi3DxMY8y1yJ2or83saX9-ZGFHFBg&s"),
              ),
              const Text('Donut balls'),
            ],
          ),
        ),
        Tab(
          height: 70,
          child: Column(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/686/686407.png"),
              ),
              const Text('Ice cream'),
            ],
          ),
        ),
        Tab(
          height: 70,
          child: Column(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Image.network(
                    "https://www.shutterstock.com/image-vector/black-hot-cup-icon-isolated-260nw-1484440349.jpg"),
              ),
              const Text('hot drinks'),
            ],
          ),
        ),
        Tab(
          height: 70,
          child: Column(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Image.network(
                    "https://w7.pngwing.com/pngs/812/150/png-transparent-smoothie-milkshake-juice-cocktail-computer-icons-cold-drink-angle-food-cocktail.png"),
              ),
              const Text('cold drinks'),
            ],
          ),
        ),
      ],
    );
  }
}
