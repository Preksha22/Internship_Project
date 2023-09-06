import 'package:flutter/material.dart';
void main(){
  runApp(Home());
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF252525)),
      home: HomePage(),
      // remove debug tag
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  String? semail;
  String? spass;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
          leading: Icon(Icons.line_axis),
          actions: [
            Icon(Icons.account_balance_wallet),
          ],
        ),
        body: Stack(
            children: [
              // Background Image
              // Positioned.fill(
              //   child: Image.asset(
              //     'assets/bg.jpg', // Replace with the path to your image asset
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // Other content goes on top of the background image
              Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50)
                        ),
                        color: Color(0xFFDED7D7)
                    ),
                    height: 300,
                    width: 300,
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 40,
                        bottom: 0
                    ),
                    // color: Colors.greenAccent,
                    child: Center(
                      child: Column(

                        children: [
                          Text("Log In", style: TextStyle(
                              fontSize: 30
                          ),),
                          TextField(
                            controller: _email,

                            // style: TextStyle(
                            //   color: Colors.red
                            // ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              icon: Icon(Icons.mail),
                              // label: Text("Email"),
                              labelText: "Email",

                              // helperText: "Enter your email here..."
                              hintText: "your e-mail",
                              // errorText: "Please enter email"

                              // floatingLabelBehavior: FloatingLabelBehavior.auto,

                              contentPadding: EdgeInsets.only(
                                  left: 5,
                                  right: 5
                              ),
                              // filled: true,
                              // fillColor: Colors.white54,

                              // focusedBorder: InputBorder.none,
                              // prefixText: "email"

                            ),
                          ),




                          TextField(
                            controller: _pass,
                            enableSuggestions: false,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.password),
                              labelText: "Password",

                              hintText: "your password",

                              contentPadding: EdgeInsets.only(
                                  left: 5,
                                  right: 5
                              ),


                            ),

                          ),
                          ElevatedButton(onPressed: (){
                            semail = _email.text;
                            spass = _pass.text;
                            print("Username is $semail");
                            print("Password is $spass");

                          },
                              child: Text("Login"))
                        ],
                      ),
                    ),
                  )
              ),
            ],
            ),
        );
    }
}