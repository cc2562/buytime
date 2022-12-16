import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
//自适应包
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
//底部栏

import './pages/hometab/home.dart';
import './pages/hometab/chart.dart';
import './pages/hometab/more.dart';
import './pages/hometab/user.dart';
//引入页面

import 'package:flutter/rendering.dart';
//布局框架

//深色模式
void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
              home: Home(),
          );
        }
    );



  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  List PageIndex = [
    hometab1(),
    chartpage(),
    user(),
    moerepage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageIndex[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("首页"),
            selectedColor: Color.fromARGB(255,255, 180, 180),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.add_chart),
            title: Text("统计"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("我的"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.category_outlined),
            title: Text("更多"),
            selectedColor: Colors.teal,
          ),
        ],

      ),
    );
  }
}
