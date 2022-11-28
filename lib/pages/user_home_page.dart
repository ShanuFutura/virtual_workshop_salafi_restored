import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_workshop/pages/login_page.dart';
import 'package:virtual_workshop/widgets/user_drawer.dart';
import 'package:virtual_workshop/widgets/workshop_list_page.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: UserDrawer(),
        appBar: AppBar(title: Text('Virtual Workshop'), actions: [
          IconButton(
              onPressed: () {
                SharedPreferences.getInstance().then(
                  (value) {
                    value.clear();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                );
              },
              icon: Icon(Icons.logout))
        ]),
        body: Stack(

          children: [
            Lottie.asset('assets/lotties/gears_outline.json'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const Padding(
                   padding: EdgeInsets.only(top: 20,bottom: 40,left: 20),
                   child: Text('Workshops near you',style: TextStyle(fontSize: 25)),
                 ),
                 Divider(),
                Expanded(child: WorkshopListPage()),
              ],
            ),
          ],
        ));
  }
}
