import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:virtual_workshop/pages/add_youtube_videos.dart';
import 'package:virtual_workshop/pages/work_request_page.dart';
import 'package:virtual_workshop/pages/youtube_videos_page.dart';

class MechanicDrawer extends StatelessWidget {
  const MechanicDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CircleAvatar(
              radius: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Mechanic'),
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
              title: Text('Add videos'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddYoutubeVideo(),
                    ),
                  );
              },
            ),
          ),
           Card(
            child: ListTile(
              title: Text('Work Requests'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkRequestPage(),
                    ),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
