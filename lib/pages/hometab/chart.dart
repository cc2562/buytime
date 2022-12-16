import 'package:flutter/material.dart';
import './topbar.dart';
import 'package:sizer/sizer.dart';

//深色模式
class chartpage extends StatefulWidget {
  const chartpage({Key? key}) : super(key: key);

  @override
  State<chartpage> createState() => _chartpageState();
}

class _chartpageState extends State<chartpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Topbar("统计", "看看每月的花费吧")
      ],
    );
  }
}

