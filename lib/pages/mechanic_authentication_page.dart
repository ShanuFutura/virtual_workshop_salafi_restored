
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:virtual_workshop/pages/mechanic_home_page.dart';
import 'package:virtual_workshop/services/services.dart';

class MechanicAuthenticationPage extends StatefulWidget {
  MechanicAuthenticationPage({super.key});

  @override
  State<MechanicAuthenticationPage> createState() => _MechanicAuthenticationPageState();
}

class _MechanicAuthenticationPageState extends State<MechanicAuthenticationPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController minWageController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  bool isLogin = true;

  GlobalKey<FormState> fkey = GlobalKey<FormState>();

  authenticate() {
    if (fkey.currentState!.validate()) {
      if (!isLogin) {
        Services.postData(endpoint: 'Mechanic_registration', params: {
          'username': usernameController.text,
          'password1': passwordController.text,
          'password2': passwordController.text,
          'workshop_name': nameController.text,
          'address': addressController.text,
          'phone_number': phoneController.text,
          'location':locationController.text,
          'min_wage':minWageController.text,
        });
      }else{
        Services.postData(endpoint: 'singin', params: {
          'username':usernameController.text,
          'password':passwordController.text,
        });
      }
    }
    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MechanicHomePage(),
                    ),
                  );
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
              if(!isLogin) Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: locationController,
                        decoration: InputDecoration(
                          label: Text('location'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.location_on_outlined),onPressed: (){
                     Services.fetchLocation().then((value) {
                      if(value is String){
                        Fluttertoast.showToast(msg: 'Something went wrong with location service');
                      }else{
                        locationController.text='${(value as LocationData).latitude},${(value as LocationData).longitude}';
                      }
                     });
                  }),
                ],
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
