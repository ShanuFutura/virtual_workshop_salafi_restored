import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_workshop/pages/add_youtube_videos.dart';
import 'package:virtual_workshop/pages/work_request_page.dart';
import 'package:virtual_workshop/pages/youtube_videos_page.dart';

import '../pages/login_page.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text('Virtual workshop'),
            ),
            Divider(),
            Card(
              child: ListTile(
                title: Text('Youtube videos'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YoutubeVideosPage(),
                      ),
                    );
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Logout'),
                onTap: () {
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
              ),
            ),
             
          ],
        ),
      ),
    );
  }
}
