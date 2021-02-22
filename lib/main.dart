import 'package:bottom_nav/second.dart';
import 'package:bottom_nav/third.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.lightBlue,
              onPressed: ()async{
                Navigator.push(context, MaterialPageRoute(builder: (context) => second() ));

            },
              child: Text("Cupertino BottomNavBar"),
            ),
            MaterialButton(
              color: Colors.deepPurpleAccent,
              onPressed: ()async{
                Navigator.push(context, MaterialPageRoute(builder: (context) => third() ));
              },
              child: Text("Cupertino 2 BottomNavBar"),
            ),
            MaterialButton(
              color: Colors.deepPurpleAccent,
              onPressed: ()async{
                Navigator.push(context, MaterialPageRoute(builder: (context) => App() ));
            },
              child: Text("Android BottomNavBar"),
            ),
          ],
        ),
      ),

    );
  }
}

