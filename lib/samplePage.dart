import 'package:bottom_nav/app.dart';
import 'package:flutter/material.dart';

class samplePage extends StatefulWidget {
  @override
  _samplePageState createState() => _samplePageState();
}

class _samplePageState extends State<samplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Page"),
      )

    );
  }
}
