import 'package:flutter/material.dart';
import 'package:virtual_workshop/pages/youtube_video_webview.dart';

import '../constants.dart';

class YoutubeVideosList extends StatelessWidget {
  const YoutubeVideosList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Constants.youtubeVideosList.length,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context) => YoutubeVideoWebview(url:  Constants.youtubeVideosList[index]['url']),));
                
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://www.freepnglogos.com/uploads/youtube-logo-icon-transparent---32.png'),
              ),
                title: Text(Constants.youtubeVideosList[index]['name'])),
          );
        },
      );
  }
}