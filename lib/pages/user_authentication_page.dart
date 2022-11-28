
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:virtual_workshop/pages/user_home_page.dart';
import 'package:virtual_workshop/services/services.dart';

class UserAuthenticationPage extends StatefulWidget {
  UserAuthenticationPage({super.key});

  @override
  State<UserAuthenticationPage> createState() => _UserAuthenticationPageState();
}

class _UserAuthenticationPageState extends State<UserAuthenticationPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();


  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  authenticate() async {
    // Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => UserHomePage(),
    //         ));
    if (fkey.currentState!.validate()) {
      Map result = {};
     
        result =
            await Services.postData(endpoint: 'user_registration', params: {
          'username': usernameController.text,
          'password1': passwordController.text,
          'password2': passwordController.text,
          'user_name': nameController.text,
          'address': addressController.text,
          'phone_number': phoneController.text,
        });
      
      if (!result['result']) {
        Fluttertoast.showToast(msg: 'Something went wrong');
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserHomePage(),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: fkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100, bottom: 30),
                child: Text(
                 'SignUp',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    label: Text('username'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: Text('name'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    label: Text('password'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    maxLines: 4,
                    minLines: 4,
                    controller: addressController,
                    decoration: InputDecoration(
                      label: Text('address'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      label: Text('phone'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: authenticate, child: Text('Sign Up')),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
