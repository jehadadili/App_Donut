import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/constants/app_size.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late CameraPosition initCameraPosition;

  @override
  void initState() {
    initCameraPosition =
        const CameraPosition(zoom: 12, target: LatLng(31.896022, 35.96217));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.height(context) - Sizes.statusBarHeight(context),
      width: Sizes.width(context),
      child: GoogleMap(
        initialCameraPosition: initCameraPosition,
      ),
    );
  }
}
