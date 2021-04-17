import 'package:dayanamiyorum/db_helper/newdatabse_Helper.dart';
import 'package:dayanamiyorum/models/newmodel.dart';
import 'package:dayanamiyorum/models/not_model.dart';
import 'package:dayanamiyorum/screen/add_not.dart';


import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int productCount = 0;
  List<Client> clients;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Client>>(
        future: DBProvider.db.getAllClientsWork(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Client item = snapshot.data[index];
                return Container(child: Text(item.firstName),);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('ekle'),
        onPressed: () async{
            bool result=await Navigator.push(context,MaterialPageRoute(builder: (context)=>AddNot()));
            if (result != null) {
                print('ad');
                setState(() {

                });
            }


        },
      ),
    );
  }
}
