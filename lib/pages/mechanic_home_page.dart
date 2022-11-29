import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:virtual_workshop/pages/work_request_page.dart';
import 'package:virtual_workshop/pages/youtube_videos_page.dart';
import 'package:virtual_workshop/widgets/mechanic_drawer.dart';
import 'package:virtual_workshop/widgets/work_requests_list.dart';
import 'package:virtual_workshop/widgets/youtube_videos_list.dart';

class MechanicHomePage extends StatefulWidget {
  MechanicHomePage({super.key});

  @override
  State<MechanicHomePage> createState() => _MechanicHomePageState();
}

class _MechanicHomePageState extends State<MechanicHomePage> {
  List<Tab> tabs = [
    Tab(
      text: 'Videos',
    ),
    Tab(
      text: 'Requests',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Virtual Workshop'),
              bottom: TabBar(tabs: tabs),
            ),
            drawer: MechanicDrawer(),
            body: TabBarView(
              children: [
                YoutubeVideosList(),
                WorkRequestList(),
              ],
            )
            // YoutubeVideosList()
            ));
  }
}
