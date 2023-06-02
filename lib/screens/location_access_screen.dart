import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/utils/globals.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            Position position = await _determinePosition();
            await getAddressFromLatLong(position);

            // const HomeScreen();
            if (context.mounted) {
              Navigator.pushNamed(context, HomeScreen.routename);
            }
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return const HomeScreen();
            // }));
          },
          style: TextButton.styleFrom(
            fixedSize: const Size(340, 60),
            backgroundColor: const Color.fromARGB(255, 241, 87, 1),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text(
            'Allow location access',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
    );
  }
}
