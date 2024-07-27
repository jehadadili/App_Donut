// import 'dart:async';
// import 'dart:developer';

// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapUrl extends GetxController {
//   String latitude = '', longitude = '';

//   Set<Marker> markers = <Marker>{};

//   ///-----------------------------///
//   ///----Select Lat Lng On Map----///
//   ///-----------------------------///
//   void selectLatLngOnMap(LatLng latlng) {
//     markers.clear();

//     setLatLng(
//       latlng.latitude.toString(),
//       latlng.longitude.toString(),
//     );

//     markers.add(
//       Marker(
//         markerId: const MarkerId('1'),
//         position: LatLng(latlng.latitude, latlng.longitude),
//       ),
//     );

//     log(latlng.latitude.toString());
//     log(latlng.longitude.toString());
//     update();
//   }

//   ///-------------------///
//   ///----Set Lat Lng----///
//   ///-------------------///
//   void setLatLng(String newLat, String newLng) {
//     latitude = newLat;
//     longitude = newLng;
//     update();
//   }

//   LatLng _currentPosition = const LatLng(31.896022, 35.96217);

//   ///-------------------------------///
//   ///----Initial Camera Position----///
//   ///-------------------------------///
//   CameraPosition initCameraPosition() {
//     CameraPosition initPosition = CameraPosition(
//       target: _currentPosition,
//       zoom: 4.5,
//     );

//     return initPosition;
//   }

//   ///------------------------///
//   ///----Current Location----///
//   ///------------------------///
//   Future<void> getLocation(
//       Completer<GoogleMapController> googleMapController) async {
//     GoogleMapController controller = await googleMapController.future;
//     await Geolocator.requestPermission();

//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     double lat = position.latitude;
//     double long = position.longitude;

//     LatLng location = LatLng(lat, long);

//     _currentPosition = location;

//     controller.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(
//           bearing: 0,
//           target: _currentPosition,
//           zoom: 10,
//         ),
//       ),
//     );

//     update();
//   }
// }