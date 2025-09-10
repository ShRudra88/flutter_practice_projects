import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: HomePage(),
  ),
);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   late PageController _pageController;

   @override
  void initState(){

     _pageController = PageController(
       initialPage: 1,
     );
    super.initState();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            children: <Widget>[
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.red,
              ),Container(
                color: Colors.white,
              ),
            ]
        )
    );
  }
}