import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class second extends StatefulWidget {
  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {

  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
  int _currentIndex;
  List<Widget> _children;

  @override
  void initState() {
    _currentIndex = 0;
    _children = [
      Screen1(),
      Screen2(),
      Screen3(),
    ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            currentIndex: _currentIndex,
            onTap: onTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Screen 1"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Screen 2"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Screen 3")),
            ]),
      tabBuilder: (BuildContext context,int index){
          return CupertinoTabView(
            builder: (BuildContext context){
              return SafeArea(
                  top: false,
                  bottom: false,
                  child:CupertinoApp(
                    home: CupertinoPageScaffold(
                        resizeToAvoidBottomInset: false,
                        child: _children[_currentIndex]),
                  )
              );
            },
          );
      },
    );
  }

  void onTapped(int index){
    print("current Index: $index");

    if(_currentIndex == index) {
      switch (index) {
        case 0:
          firstTabNavKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 1:
          secondTabNavKey.currentState.popUntil((r) => r.isFirst);
          break;
        case 2:
          thirdTabNavKey.currentState.popUntil((r) => r.isFirst);
          break;
      }
    }


    setState(() {
      _currentIndex = index;
    });
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Click me"),
          onPressed: () {
            Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
                builder: (context) => Screen4(), maintainState: false));
          },
        ),
      ),
    );
  }

}

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text("Go back"),
          /*onPressed: () {
            Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
                builder: (context) => Screen3(), maintainState: false));
          },*/
        ),
      ),
    );
  }

}
class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("2nd"),),
    );
  }

}
class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("1st"),),
    );
  }

}