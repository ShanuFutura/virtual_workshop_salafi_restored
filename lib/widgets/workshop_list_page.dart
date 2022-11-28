import 'dart:math';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../models/workshop_model.dart';
import '../services/services.dart';

class WorkshopListPage extends StatelessWidget {
  WorkshopListPage({super.key});
  static const String routeName = 'workshop list page';

  List<WorkShop> workshops = [];
  getData(BuildContext context) async {
    final locData = await Services.fetchLocation();
    if (!(locData is LocationData)) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Location error'),
                content:
                    Text('Kindly enable location permission in app settings'),
              ));
    } else {
      var data = await Services.getData(endpoint: 'workshop');
      if (data is List) {
        workshops = data.map((e) => WorkShop.fromJson(e)).toList();
      }
      workshops.forEach((element) {
       element.distance= Services.calculateDistance(locData.latitude, locData.longitude,
            element.location.split(',').first, element.location.split(',')[1]);
      });
      workshops.sort((a, b) => a.distance.compareTo(b.distance),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(context),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: workshops.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 9,
                child: ListTile(
                  title: Text(workshops[index].workshopName),
                  subtitle: Text(workshops[index].phoneNumber),
                  trailing: Text('${workshops[index].distance} Kms'),
                ),
              );
            },
          );
        },
      );
  }
}
