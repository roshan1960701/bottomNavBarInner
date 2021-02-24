import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:the_little_people/models/SubscriptionPlans.dart';
import 'package:the_little_people/screens/cancel_subscription.dart';
import 'package:the_little_people/screens/downloadScreen.dart';
import 'package:the_little_people/screens/editprofile.dart';
import 'package:the_little_people/screens/home.dart';
import 'package:the_little_people/screens/purchase_subscription.dart';
import 'package:the_little_people/utilities.dart';
import 'package:the_little_people/AudioPlayer.dart';
import 'package:custom_navigator/custom_navigator.dart';

class customNavBarOne extends StatefulWidget {
  /*final int cloudIndex;
  customNavBar(this.cloudIndex) : super();*/

  @override
  _customNavBarOneState createState() => _customNavBarOneState();
}

class _customNavBarOneState extends State<customNavBarOne> {


  int iconChangeHome = 0;
  // final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  // final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  // final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

  String userID = "";
  PageController _myPage = PageController(initialPage: 0);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 Widget _page = HomeScreen();


  @override
  initState() {
    super.initState();
    fetchUserId();

  }

  fetchUserId()async{
    userID = await getUserID();
    print("userid: " + userID);

  }

  Widget customNavBarItem(int num,String iconPath,/*Widget route,String routeName*/){
    return InkWell(
      child: iconChangeHome/*widget.cloudIndex*/ == num ? Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
              top: -15,
              left: -30,
              bottom: -15,
              child: SvgPicture.asset('assets/cloud.svg')),
          SvgPicture.asset('$iconPath',height: 38,width: 38,),
        ],) : SvgPicture.asset('$iconPath',height: 38,width: 38,
      ),
      onTap: (){

        setState(() {
          iconChangeHome = num;
          _myPage.jumpToPage(num);
        });

      },
    );
  }

  Widget navBarItem(int num,String iconPath,Widget route){
    return InkWell(
      child: iconChangeHome/*widget.cloudIndex*/ == num ? Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
              top: -15,
              left: -30,
              bottom: -15,
              child: SvgPicture.asset('assets/cloud.svg')),
          SvgPicture.asset('$iconPath',height: 38,width: 38,),
        ],) : SvgPicture.asset('$iconPath',height: 38,width: 38,
      ),
      onTap: (){

        navigatorKey.currentState.maybePop();

        setState(() {
          iconChangeHome = num;
          _page = route;
        });

      },
    );
  }
  /*Widget cloudIcon(String iconPath){
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
            top: -15,
            left: -30,
            bottom: -15,
            child: SvgPicture.asset('assets/cloud.svg')),
        SvgPicture.asset('$iconPath',height: 38,width: 38,),
      ],);
  }*/

  /*Widget itemIcon(String iconPath){
    return SvgPicture.asset('$iconPath',height: 38,width: 38,
    );
  }*/



  @override
  Widget build(BuildContext context) {
    var storyPlayer = Provider.of<AudioPlayer>(context);

    return Scaffold(
      body: WillPopScope(
        //TODO://addeb WillPopScope for back pressed redirect to HomePage
        onWillPop: () async{
          if(iconChangeHome != 0) {
            setState(() {
              iconChangeHome = 0;
              // _myPage.jumpToPage(0);
            });
            _myPage.jumpToPage(_myPage.initialPage);
          }
          else{
            if(navigatorKey.currentState.canPop()){
              navigatorKey.currentState.maybePop();
            }else{
              exit(0);
            }
          }
          return false;
        },

        child: CustomNavigator(
          navigatorKey: navigatorKey,
          home: _page,
          //Specify your page route [PageRoutes.materialPageRoute] or [PageRoutes.cupertinoPageRoute]
          pageRoute: PageRoutes.materialPageRoute,
        ),
        /*child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _myPage,
          onPageChanged: (int){
            print('Page changes to index $int');
          },
          children: <Widget>[
            HomeScreen(),
            downloadScreen(),
            storyPlayer.subData == "" ? PurchaseSubscriptionScreen() : CancelSubscriptionScreen(),
            EditProfileScreen(userID, 'home'),

          ],
        ),*/


      ),
      bottomNavigationBar: Container(
        color: Color(0xFFF2F2F2),
        //color: Colors.grey.withOpacity(0.2),
        height: 60,
        // color: Colors.red,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[

            /*Positioned(
              bottom: -20.0,
              top: -20,
              left: -55,
              right: -55,
              child: SvgPicture.asset('assets/bottomNavPath.svg',
              ),
            ),*/

            Positioned(
              top: 5,
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  /*customNavBarItem(0, 'assets/home-nav-icon.svg'*//*,HomeScreen(),'Home'*//*),
                  customNavBarItem(1, 'assets/home-nav-download.svg'*//*,PurchaseSubscriptionScreen(),'subscription'*//*),
                  customNavBarItem(2, 'assets/christmas-star.svg'*//*,PurchaseSubscriptionScreen(),'subscription'*//*),
                  customNavBarItem(3, 'assets/home-nav-smily.svg'*//*,EditProfileScreen(userID, 'home'),'Edit profile'*//*),*/
                  navBarItem(0, 'assets/home-nav-icon.svg',HomeScreen()),
                  navBarItem(1, 'assets/home-nav-download.svg',downloadScreen()),
                  navBarItem(2, 'assets/christmas-star.svg',storyPlayer.subData == "" ? PurchaseSubscriptionScreen() : CancelSubscriptionScreen()),
                  navBarItem(3, 'assets/home-nav-smily.svg',EditProfileScreen(userID, 'home')),
                ],
              ),
            )

          ],
        ),
      ),
    );

  }
}





