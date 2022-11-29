import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:virtual_workshop/widgets/work_requests_list.dart';

class WorkRequestPage extends StatelessWidget {
  const WorkRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorkRequestList(),
    );
  }
}