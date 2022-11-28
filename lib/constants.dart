import 'package:virtual_workshop/models/message.dart';

class Constants {
  static String BASE_URL = 'http://192.168.68.147:8000/';

  static List<Map> youtubeVideosList = [
    {'name': 'test', 'url': 'https://www.jsontodart.in/'},
    {'name': 'test1', 'url': 'asdfasdgasdf'},
    {'name': 'test2', 'url': 'asdfasdgasdf'},
  ];


static List<Message> messages=[
  Message(imageUrl: '', message: '', name: '', time: ''),
  Message(imageUrl: '', message: '', name: '', time: ''),
  Message(imageUrl: '', message: '', name: '', time: ''),
  Message(imageUrl: '', message: '', name: '', time: ''),
];




  static String imageUrl =
      'https://evol.hr/wp-content/uploads/WebShopSynch-028CCF585F910D0087A7F8220ABAE984-2220011-no-image-1.jpg';
      //PLACEHOLDER IMAGETO DISPLAY IN YOUTUBE VIDEO ADD SCREEN
}
