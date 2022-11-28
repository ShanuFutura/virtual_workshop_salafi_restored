import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_workshop/pages/mechanic_authentication_page.dart';
import 'package:virtual_workshop/pages/mechanic_home_page.dart';
import 'package:virtual_workshop/pages/user_authentication_page.dart';
import 'package:virtual_workshop/pages/user_home_page.dart';
import 'package:virtual_workshop/services/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  authenticate() async{
    print('object');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => MechanicHomePage(),
    //   ),
    // );
    if (fkey.currentState!.validate()) {
      Map result = {};

    result=await  Services.postData(endpoint: 'login_views', params: {
        'uname': usernameController.text,
        'pass': passwordController.text,
      });

      if (!result['status']) {
        Fluttertoast.showToast(msg: 'Something went wrong');
      } else {
        storeUserData(
          '${result['result']['id']}',
          result['result']['type'],
        ).then(
          (_) {
            if (result['result']['type'] == 'user') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => UserHomePage(),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MechanicHomePage(),
                ),
              );
            }
          },
        );
      }
    }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => MechanicHomePage(),
    //   ),
    // );
  }

  Future<void> storeUserData(String userId, String userType) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    spref.setString('userId', userId);
    spref.setString('userType', userType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: fkey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100, bottom: 30),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Lottie.asset('assets/lotties/mech_gears.json'),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "enter something";
                    }
                  },
                  controller: usernameController,
                  decoration: const InputDecoration(
                    label: Text('username'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "enter something";
                    }
                  },
                  controller: passwordController,
                  decoration: const InputDecoration(
                    label: Text('password'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: authenticate, child: Text('Login')),
              ),
              const Padding(
                padding: const EdgeInsets.all(10),
                child: Text('OR'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Signup as'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserAuthenticationPage(),
                          ));
                    },
                    child: Text('Customer'),
                  ),
                  Text('/'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MechanicAuthenticationPage(),
                          ));
                    },
                    child: Text('Mechanic'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
