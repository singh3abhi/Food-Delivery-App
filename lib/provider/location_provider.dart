import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  double? _latitude; // Global latitude
  double? _longitude; // Global longitute
  String? _mainAddress; // Global main address
  String? _secondaryAddress; // Global secondary address

  double? _tempLatitude; // Temporary latitude
  double? _tempLongitude; // Temporary longitute
  String? _tempMainAddress; // Temporary main address
  String? _tempSecondaryAddress; // Temporary secondary address

  // Global latitude getter
  double get latitude => _latitude!;

  // Global longitude getter
  double get longitude => _longitude!;

  // Global main address getter
  String get mainAddress => _mainAddress!;

  // Global secondary address getter
  String get secondaryAddress => _secondaryAddress!;

  // Temporary latitude getter
  double get tempLatitude => _tempLatitude!;

  // Temporary longitude getter
  double get tempLongitude => _tempLongitude!;

  // Temporary main address getter
  String get tempMainAddress => _tempMainAddress!;

  // Temporary secondary address getter
  String get tempSecondaryAddress => _tempSecondaryAddress!;

  bool addressEmpty = true;
  bool latLongEmpty = true;
  bool loading = false;

  void setGlobalAddress({required String mainAddress, required String secondaryAddress}) {
    debugPrint('Setting Address');
    _mainAddress = mainAddress;
    _secondaryAddress = secondaryAddress;
  }

  void setGlobalFromTemp() {
    _latitude = _tempLatitude;
    _longitude = _tempLongitude;
    _mainAddress = _tempMainAddress;
    _secondaryAddress = _tempSecondaryAddress;

    latLongEmpty = false;
  }

  // Setter for default temp values (Global Values)
  void setTempDefault() {
    _tempLatitude = _latitude;
    _tempLongitude = _longitude;
    _tempMainAddress = _mainAddress;
    _tempSecondaryAddress = _secondaryAddress;

    notifyListeners();
  }

  // Setter for temp values
  void setTempLocation({
    required double latitude,
    required double longitude,
    required String mainAddress,
    required String secondaryAddress,
  }) {
    _tempLatitude = latitude;
    _tempLongitude = longitude;
    _tempMainAddress = mainAddress;
    _tempSecondaryAddress = secondaryAddress;

    notifyListeners();
  }

  // Check Location Service & Permission Enabled Or not
  Future checkPermissionAndService() async {
    loading = true;

    bool serviceEnabled;
    LocationPermission permission;

    // Check Permission Given Or Not
    debugPrint('Checking Permission');
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      debugPrint('Requesting Permission');
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Permission Denied');
        return Future.error('Location permissions are denied');
      }
    }

    // Check Location Service On Or Not
    debugPrint('Checking Location Service');
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Requesting Location Service');
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    loading = false;
  }

  // Get Latitude and Longitude
  Future determinePosition() async {
    loading = true;

    debugPrint('Getting Current Position');
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    _latitude = position.latitude;
    _longitude = position.longitude;

    latLongEmpty = false;

    loading = false;
  }

  // Get Address From Latitude and Longitude
  Future getAddressFromLatLong() async {
    loading = true;

    debugPrint('Getting Address From LatLong');
    List<Placemark> placemark = await placemarkFromCoordinates(
      latitude,
      longitude,
    );
    Placemark place = placemark[0];

    _mainAddress = place.name!;
    _secondaryAddress = '${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';

    addressEmpty = false;

    setTempDefault();
    loading = false;
  }

  // Get Lat & Long from Address
  Future getLatLongFromAddress() async {
    loading = true;

    debugPrint('Converting Address to LatLong');
    List<Location> locations = await locationFromAddress('$mainAddress,$secondaryAddress');
    _latitude = locations.last.latitude;
    _longitude = locations.last.longitude;

    latLongEmpty = false;
    setTempDefault();

    loading = false;
  }
}
