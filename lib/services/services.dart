import 'dart:convert';
import 'dart:math';

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

  static getData({required String endpoint})async{
    Response res= await get(Uri.parse(Constants.BASE_URL+endpoint));
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

  static String convertVideoLinkToImage(String videoUrl){
    // CUT LAST ELEVEN CHARS AND ADD  https://i.ytimg.com/vi/ AT THE BRGGING ... DONE
    print('https://i.ytimg.com/vi/${videoUrl.substring(videoUrl.length-11, videoUrl.length)}');
return 'https://i.ytimg.com/vi/${videoUrl.substring(videoUrl.length-11, videoUrl.length)}/hq720.jpg';

  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
