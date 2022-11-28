// import 'package:flutter/material.dart';
// import 'package:virtual_workshop/pages/mechanic_authentication_page.dart';
// import 'package:virtual_workshop/pages/user_authentication_page.dart';

// class AuthSwitchPage extends StatelessWidget {
//   const AuthSwitchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 100),
//             child: const Text('Who are you?', style: TextStyle(fontSize: 30)),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UserAuthenticationPage(),
//                     ),
//                   );
//                 },
//                 child: SizedBox(
//                     height: 100,
//                     width: 100,
//                     child: Center(child: Text('User'))),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MechanicAuthenticationPage(),
//                     ),
//                   );
//                 },
//                 child: SizedBox(
//                     height: 100,
//                     width: 100,
//                     child: Center(child: Text('Mechanic'))),
//               ),
//             ],
//           ),
//         ],
//       )),
//     );
//   }
// }
