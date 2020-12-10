import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:voltro_dxb/screens/home.dart';
import 'package:voltro_dxb/screens/search.dart';
import 'package:voltro_dxb/utils/constants.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        backgroundColor: Colors.blue,
        tabBar: CupertinoTabBar(
            backgroundColor: Constants.primaryColor,
            activeColor: Colors.white,
            inactiveColor: Colors.white54,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
              ),
            ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return Home();
              break;
            case 1:
              return Search();
              break;
            default:
              return Home();
              break;
          }
        });
  }
}
