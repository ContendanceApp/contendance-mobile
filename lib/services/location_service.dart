import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  // ignore: unused_field
  late LocationData _locationData;

  getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      print("location disabled");
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }
}
