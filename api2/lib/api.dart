import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart 'as http;
class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {

  TextEditingController _field1=TextEditingController();
  TextEditingController _field2=TextEditingController();
  TextEditingController _field3=TextEditingController();
  String ? field1;
  String ? field2;
  String ? field3;
  String ? field1a;
  String ? field2a;
  String ? field3a;

  // double ? field11;
  // double ? field22;
  // double ? field33;

  void getloc()async
  {
    // field1=_field1.text;
    // field2=_field2.text;
    // field3=_field3.text;
    final field=await http.get(
        Uri.parse("https://api.thingspeak.com/channels/1596152/feeds.json?api_key=P7S0UYX236LLKQJU&results=2"));
    var data=jsonDecode(field.body.toString());

    setState(() {
      field1=data['channel']['field1'];
      field2=data['channel']['field2'];
      field3=data['channel']['field3'];

      print(field1);
      print(field2);
      print(field3);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
              title:Text("api data"),
              actions: [
                Icon(Icons.add),
              ],
            ),
            body: Center(
              child: Container
                (child: Column(
                children: [
                  Text("$field1 : "),
                  Text("$field2"),
                  Text("$field3"),

                  ElevatedButton(onPressed: (){getloc();}, child:Text("get"),),
                ],
              )),
            )
            )
        );
    }
}