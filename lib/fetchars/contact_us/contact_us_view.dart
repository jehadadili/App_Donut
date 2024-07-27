import 'package:flutter/material.dart';
import 'package:marckit/core/components/my_button.dart';
import 'package:marckit/core/utils/builder_app_bar.dart';
import 'package:marckit/fetchars/contact_us/maps/view/maps_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'ContactUs'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(
              title: "Email",
              onPressed: () {
                Uri uri = Uri.parse('mailto:jehadadili010@gmail.com');
                launchUrl(uri);
              },
            ),
            MyButton(
              title: "phone Number",
              onPressed: () {
                Uri uri = Uri.parse('tel:00962790119723');
                launchUrl(uri);
              },
            ),
            MyButton(
              title: "Map",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MapPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
