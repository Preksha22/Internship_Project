import 'package:flutter/material.dart';
import 'api.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}
void main()
{
  runApp(home());
}
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:api()
    );
    }
}
