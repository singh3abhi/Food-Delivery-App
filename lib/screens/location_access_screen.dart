import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/old_home_screen.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/nested_home_screen3.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});
  static String routename = '/location-access-screen';

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  String street = '';
  String address = '';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemark = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark place = placemark[0];

    street = place.name!;
    address = '${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';

    GlobalLocationValues.setLocationValues(addressFromPhone: address, nameFromPhone: street);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        automaticallyImplyLeading: false,
      ),
      body: Column(
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
              onPressed: () async {
                Position position = await _determinePosition();
                await getAddressFromLatLong(position);

                // const HomeScreen();
                if (context.mounted) {
                  print(homeCategoryItems.length);
                  print(homeCategoryItems.length / 2);
                  print(homeCategoryItems.length ~/ 2);
                  Navigator.pushNamed(context, HomeScreen.routename);
                }
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                //   return const HomeScreen();
                // }));
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 241, 87, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 60),
              ),
              child: const Text(
                'Allow location access',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Enter Location Manually',
                  style: TextStyle(
                    color: Color.fromARGB(255, 241, 87, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
