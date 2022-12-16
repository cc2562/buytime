import 'package:flutter/material.dart';
import './topbar.dart';
import 'package:sizer/sizer.dart';

//深色模式
class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  String userName = 'CC米饭';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Topbar("$userName", "管理账户吧")
      ],
    );
  }
}

