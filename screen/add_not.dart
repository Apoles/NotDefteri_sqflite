import 'package:dayanamiyorum/db_helper/newdatabse_Helper.dart';
import 'package:dayanamiyorum/models/newmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddNot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var noteEditingController=TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Note'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10,right: 10),
          child: Container(
            child: ListView(
              children: [
                ElevatedButton(onPressed: (){

                  DBProvider.db.newClient(Client(firstName: noteEditingController.text));

                  Navigator.pop(context,true);

                }, child: Icon(Icons.add),),
                TextFormField(
                  controller: noteEditingController,
                  onChanged: (noteControl){

                  },
                  maxLines: 31,
                  cursorHeight: 20,
                  cursorColor: Colors.black,
                  toolbarOptions: ToolbarOptions(
                      selectAll: true, paste: true, copy: true, cut: true),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ],
            ),
            width: size.width,
            height: size.height,
          ),
        ));
  }
}
