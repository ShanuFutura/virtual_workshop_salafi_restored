import 'dart:convert';

import 'package:http/http.dart';
import 'package:virtual_workshop/constants.dart';
import 'package:location/location.dart';

class Services {
  static postData({required String endpoint, required Map params}) async {
    Response res =
        await post(Uri.parse(Constants.BASE_URL + endpoint), body: params);
    print(res.body);
    if (res.statusCode < 300 && res.statusCode > 199) {
      return jsonDecode(res.body);
    } else {
      return {'result': 'something went wrong'};
    }
  }

  static Future<dynamic> fetchLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return 'no service';
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return 'no service';
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}
