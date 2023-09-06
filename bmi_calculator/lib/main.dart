import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }

}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  TextEditingController _email = TextEditingController();
  //TextEditingController _pass = TextEditingController();
  TextEditingController _width = TextEditingController();
  TextEditingController _height = TextEditingController();
  @override

  double _wid = 0.0;
  double _hei = 0.0;
  double bmii = 0.0;
  String res = "";
  void bmi(){
    _hei = double.parse(_height.text);
    _wid = double.parse(_width.text);
    setState((){
      bmii = _wid/(_hei*_hei);
      if (bmii <= 0){ res="Rightweight";
      }else{
        res ="Underweight";
      };
    });
  }

  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
          leading: Icon(Icons.connected_tv_rounded),
          actions: [
            Icon(Icons.abc),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ],
        ),

        body:
        Padding(
            padding: EdgeInsets.all(20.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child:Text("Login Form", style:TextStyle(fontSize: 25),),
                ),
                TextField(
                  controller: _email ,
                  decoration: InputDecoration(
                    hintText: "Name",
                    contentPadding: EdgeInsets.fromLTRB(5, 2, 5, 1),
                  ),

                ),

                TextField(
                  controller:_width,
                  decoration: InputDecoration(
                    hintText: "Wight",
                    contentPadding: EdgeInsets.fromLTRB(5, 2, 5, 1),
                  ),

                ),
                TextField(
                  controller:_height,
                  decoration: InputDecoration(
                    hintText: "height",
                    contentPadding: EdgeInsets.fromLTRB(5, 2, 5, 1),
                  ),
                ),

                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0), // Set top padding here
                  child: ElevatedButton(
                    onPressed: () {
                      bmi();
                    },
                    child: Text("Submit"),

                  ),
                ),
                Text('weight :$_wid'),
                Text('height:$_hei'),
                Text('Bmi :$bmii'),
                Text('conditon :$res'),




              ],
            )
        )

        );
    }
  }