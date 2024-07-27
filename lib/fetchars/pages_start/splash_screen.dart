import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marckit/core/constants/app_size.dart';
import 'package:marckit/core/constants/assets_data.dart';
import 'package:marckit/fetchars/pages_start/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const GetStarted();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          AssetsData.splashscrren,
          width: Sizes.width(context),
          height: Sizes.height(context),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
