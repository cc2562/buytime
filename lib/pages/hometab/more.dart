import 'package:flutter/material.dart';
import './topbar.dart';
import 'package:sizer/sizer.dart';

//深色模式
class moerepage extends StatefulWidget {
  const moerepage({Key? key}) : super(key: key);

  @override
  State<moerepage> createState() => _moerepageState();
}

class _moerepageState extends State<moerepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Topbar("更多", "无限的惊喜")
      ],
    );
  }
}

