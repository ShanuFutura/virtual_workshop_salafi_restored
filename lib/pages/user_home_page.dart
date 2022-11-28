import 'package:flutter/material.dart';
import 'package:virtual_workshop/widgets/workshop_list_page.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Virtual Workshop'),),
      body: Column(
        children: [
          const SizedBox(height: 400,),
          Expanded(child: WorkshopListPage()),
        ],
      )
    );
  }
}