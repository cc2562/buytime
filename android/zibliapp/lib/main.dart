import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_framework/responsive_framework.dart';
//tab栏目
//页面
import './home/tab2.dart';
import './home/tab1.dart';
void main() {
  runApp(const homepage());
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}
enum _SelectedTab { home, favorite, search, person }
class _homepageState extends State<homepage> {
  List pages = [
    tab1page(),
    tab2page(),
  ];

  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      _selectedIndex = i;
    });
  }

  var _selectedIndex = 0;
  var _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
      child,
      maxWidth: 1600,
      minWidth: 400,
      defaultScale: true,
      breakpoints: [
        ResponsiveBreakpoint.resize(480, name: MOBILE),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.resize(1000, name: DESKTOP),
      ],
        ),
      home:Scaffold(
          bottomNavigationBar:  DotNavigationBar(
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            onTap: _handleIndexChanged,
            // dotIndicatorColor: Colors.black,
            items: [
              /// Home
              DotNavigationBarItem(
                icon: Icon(Iconsax.home5),
                selectedColor: Colors.purple,
              ),

              /// Likes
              DotNavigationBarItem(
                icon: Icon(Iconsax.lovely5),
                selectedColor: Colors.pink,
              ),

              /// Search
              DotNavigationBarItem(
                icon: Icon(Icons.search),
                selectedColor: Colors.orange,
              ),

              /// Profile
              DotNavigationBarItem(
                icon: Icon(Icons.person),
                selectedColor: Colors.teal,
              ),

            ],
          ),
        body: pages[_selectedIndex]
      ) ,
    );


  }
}

