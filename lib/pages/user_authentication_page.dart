import 'dart:ui';

import 'package:flutter/material.dart';
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

  bool isLogin = true;

  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  authenticate() {
    if (fkey.currentState!.validate()) {
      if (!isLogin) {
        Services.postData(endpoint: 'user_registration', params: {
          'username': usernameController.text,
          'password1': passwordController.text,
          'password2': passwordController.text,
          'user_name': nameController.text,
          'address': addressController.text,
          'phone_number': phoneController.text,
        });
      }else{
        Services.postData(endpoint: 'singin', params: {
          'username':usernameController.text,
          'password':passwordController.text,
        });
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
                  isLogin?'Login':'SignUp',
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
              if(!isLogin) Padding(
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
            if(!isLogin)  Padding(
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
             if(!isLogin) Padding(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New to this ?'),
                  TextButton(onPressed: (){
                    setState(() {
                      isLogin=!isLogin;
                    });
                  }, child: Text('Login instead')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
