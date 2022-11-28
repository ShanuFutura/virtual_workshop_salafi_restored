import 'package:flutter/material.dart';
import 'package:virtual_workshop/constants.dart';
import 'package:virtual_workshop/pages/add_youtube_videos.dart';

class YoutubeVideosPage extends StatelessWidget {
  const YoutubeVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: Constants.youtubeVideosList.length,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://www.freepnglogos.com/uploads/youtube-logo-icon-transparent---32.png'),
              ),
                title: Text(Constants.youtubeVideosList[index]['name'])),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => AddYoutubeVideo(),));
      },child: Icon(Icons.add)),
    );
  }
}
