import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'second.dart';

class third extends StatefulWidget {
  @override
  _thirdState createState() => _thirdState();
}

class _thirdState extends State<third> {
  int currentIndex = 0;

  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              navigatorKey: firstTabNavKey,
              builder: (BuildContext context) => Screen1(),
            );
            break;
          case 1:
            return CupertinoTabView(
              navigatorKey: secondTabNavKey,
              builder: (BuildContext context) => Screen2(),
            );
            break;
          case 2:
            return CupertinoTabView(
              navigatorKey: thirdTabNavKey,
              builder: (BuildContext context) => Screen3(),
            );
            break;
        }
        return null;
      },
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            title: Text('Tab 1'),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text('Tab 2'),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text('Tab 3'),
              icon: Icon(Icons.home)
          ),
        ],
        onTap: (index){
          // back home only if not switching tab
          if(currentIndex == index) {
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
          currentIndex = index;
        },
      ),
    );

  }
}
