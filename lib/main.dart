import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_workshop/pages/auth_switch_page.dart';
import 'package:virtual_workshop/pages/login_page.dart';
import 'package:virtual_workshop/pages/mechanic_home_page.dart';
import 'package:virtual_workshop/pages/user_authentication_page.dart';
import 'package:virtual_workshop/pages/user_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String?> isNewUser() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    String? type = spref.getString('userType');
    return type;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: isNewUser(),
        builder: (context, AsyncSnapshot<String?> snap) {
          if (!snap.hasData) {
            return LoginPage();
          } else {
            if (snap.data == 'user') {
              return UserHomePage();
            } else if (snap.data == 'mechanic') {
              return MechanicHomePage();
            } else {
              return LoginPage();
            }
          }
        },
      ),
    );
  }
}
