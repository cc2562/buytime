import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fluent_appbar/fluent_appbar.dart';
//深色模式
Widget Topbar(String title,String subtitle){

  //return FluentAppBar(scrollController: "scrollController", titleText: '$title',);

  return Container(
  width: 100.w,
  height: 15.h,
  color: Colors.white,
  child: Padding(padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
  child: Column(
  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  SizedBox(height: 8.h,),
  Row(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
  Text("$title",
  style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.sp
  ),
  ),
  SizedBox(width: 2.w,),
Text("$subtitle",
style: TextStyle(
color: Colors.black45,
),
),
],
)

],
),
)

);
}