import 'dart:ui';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import './topbar.dart';
import 'package:fluent_appbar/fluent_appbar.dart';


//深色模式
import './newapp.dart';
class hometab1 extends StatefulWidget {
  const hometab1({Key? key}) : super(key: key);

  @override
  State<hometab1> createState() => _hometab1State();
}

class _hometab1State extends State<hometab1> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              child: FluentAppBar(scrollController: _scrollController, titleText: '首页',),
              color: Colors.white,
            ),
            //Topbar("首页", '管理你的订阅'),
            Container(
              height: 3.h,
              width: 100.w,
              color: Colors.white,
            ),
            Container(
              child: Expanded(
                  child: Padding(padding: EdgeInsets.fromLTRB(16,0,16,0),
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      InkWell(
                        child: Card(
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  //image
                                  Container(
                                    width: 15.w,
                                    height: 15.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://www.riceshare.com/wp-content/uploads/2022/07/1657510345-GifCam1.gif"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  //APPNAME
                                  SizedBox(width: 2.w,),
                                  Expanded(
                                      flex: 1,
                                      child:
                                      Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("米饭订阅",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            Text("这是一段文本描述!",maxLines: 1,overflow: TextOverflow.fade,style: TextStyle(color: Colors.black45),)
                                          ],
                                        ),
                                      )
                                  ),
                                  //Date
                                  Expanded(child:
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("13￥",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 255, 222, 180),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                        Text("还有3天到期",textAlign: TextAlign.right,style: TextStyle(color: Colors.black45),)
                                      ],
                                    ),
                                  )
                                  ),

                                ],
                              ),
                            )

                        ),
                        onTap: (){
                          print("object");
                          },
                      ),


                    ],
                  )),
                  )


            )
          ],
        ),
        floatingActionButton: ScrollingFabAnimated(
          color: Color.fromARGB(255, 255, 180, 180),
          elevation: 1,
          height: 60,
          width: 110,
          icon: Icon(Icons.add, color: Colors.white),
          text: Text(
            '添加',
            style: TextStyle(color: Colors.white, fontSize: 12.0.sp),
          ),
          onPress: () {
            //添加订阅
            showCupertinoModalBottomSheet(
              context: context,
              builder: (context) => AddNewApp(),
            );
          },
          scrollController: _scrollController,
          animateIcon: true,
          inverted: false,
          radius: 100.0,
        ));
  }
}



