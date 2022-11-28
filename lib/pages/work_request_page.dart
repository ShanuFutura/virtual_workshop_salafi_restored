import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:virtual_workshop/models/work_request_model.dart';
import 'package:virtual_workshop/services/services.dart';

class WorkRequestPage extends StatelessWidget {
   WorkRequestPage({super.key});

  List<WorkRequest>? requests;

Future<List<WorkRequest>> getData(BuildContext context)async{
 List data= await Services.getData(endpoint: 'Wrequest_view');
  requests=data.map((e) => WorkRequest.fromJson(e)).toList();
return requests!;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getData(context),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          return Card(
            child: ListView.builder(
              itemCount: requests!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(requests![index].name),
                  subtitle: Text(requests![index].location),
                  trailing: Text(requests![index].problem),
                );
              },
            ),
          );
        },
      ),
    );
  }
}