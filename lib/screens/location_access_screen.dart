import 'package:flutter/material.dart';
import 'package:food_delivery_app/provider/location_provider.dart';
import 'package:food_delivery_app/screens/home_screen.dart';

import 'package:food_delivery_app/screens/location_search_screen.dart';
import 'package:food_delivery_app/utils/globals.dart';

import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});
  static String routename = '/location-access-screen';

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.025),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What\'s your location?',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'We need your location to show available\nrestaurants & products',
                    style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Lottie.network(
              'https://assets10.lottiefiles.com/packages/lf20_kuiykf08.json',
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Text(
                  'Allow location access',
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: () => checkPermissionAndService(
                  context: context,
                  onSuccess: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        child: const HomeScreen(),
                        type: PageTransitionType.fade,
                      ),
                      (route) => false,
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text(
                    'Enter Location Manually',
                    style: TextStyle(
                      color: kColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    PageTransition(
                      child: const LocationSearchScreen(),
                      type: PageTransitionType.bottomToTop,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void checkPermissionAndService({
    required BuildContext context,
    required Function onSuccess,
  }) {
    final lp = Provider.of<LocationProvider>(context, listen: false);
    lp.checkPermissionAndService().then(
          (value) => onSuccess(),
        );
  }
}
