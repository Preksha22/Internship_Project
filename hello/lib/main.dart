import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


void main() {
  runApp(Simple());
}

class Simple extends StatelessWidget {
  const Simple({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Second(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();

  String img = "assets/img.png";
  int con = 0;
  String _city = "";
  String _state = "";
  String _country = "";
  double ?lat1;
  double ?lon1;
  var temp;
  var p;
  var h;


  void count(int cnt) {
      if (cnt == 0) {
        setState(() {
          img = "img_2.png";
          con = 1;
        });
      }
      if(cnt == 1) {
        setState(() {
          img = "img.png";
          con = 0;
        });
      }
  }

  void getloc() async{
    _city=city.text;
    _state=state.text;
    _country=country.text;
    final loc = await http.get(Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=$_city,$_state,$_country&limit=4&appid=b3dafc9a8012bfd5ba545b6fac55a169'));
    var data = jsonDecode(loc.body.toString());
    print(data);
    lat1=data[0]['lat'];
    lon1=data[0]['lon'];
    print(lat1);
    print(lon1);
    final weather = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat1&lon=$lon1&appid=b3dafc9a8012bfd5ba545b6fac55a169"));
    var dataa = jsonDecode(weather.body.toString());
    print(dataa);
    temp=dataa['main']['temp'];
    p=dataa['main']['pressure'];
    h=dataa['main']['humidity'];
    print(temp);
    print(p);
    print(h);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple UI"),
        leading: Icon(Icons.bubble_chart),
        actions: [IconButton(onPressed: () {}, icon: Icon(
          Icons.library_books,))
        ],
      ),
      body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              )
          ),
          child: Center(
            child: Column(
              children: [
                TextField(controller: city,
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(hintText: "City")),
                TextField(controller: state,
                    style: TextStyle(color: Colors.cyan),
                    decoration: InputDecoration(hintText: "State")),
                TextField(controller: country,
                    style: TextStyle(color: Colors.greenAccent),
                    decoration: InputDecoration(hintText: "Country")),
                ElevatedButton(onPressed: () {
                  count(con);
                  getloc();
                  //Navigator.push(context, MaterialPageRoute(builder: (hi)=>Third()));
                }, child: Text("Submit"))
              ],
            ),
          ),
          ),);
    }
  }