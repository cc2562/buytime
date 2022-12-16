import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:bruno/bruno.dart';

//自适应包
import './add/newdetail.dart';

//深色模式
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

//初始化
// This list holds the data for the list view
List _foundUsers = [];

class AddNewApp extends StatefulWidget {
  const AddNewApp({Key? key}) : super(key: key);

  @override
  State<AddNewApp> createState() => _AddNewAppState();
}

class _AddNewAppState extends State<AddNewApp> {
  FocusNode focusNode = FocusNode();
  BrnSearchTextController searchController = BrnSearchTextController();
  TextEditingController textController = TextEditingController();

  @override
  initState() {
    // at the beginning, all users are shown

    _foundUsers = _listDatas;

    ///initState 中添加监听，记得销毁
    textController.addListener(() {
      if (focusNode.hasFocus) {
        if (textController.text.isEmpty) {
          searchController.isClearShow = true;
          searchController.isActionShow = true;
        }
      }
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        if (textController.text.isEmpty) {
          searchController.isClearShow = true;
        }
      }
    });

    super.initState();
  }

  //筛选
// This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _listDatas;
    } else {
      results = _listDatas
          .where((user) => user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "添加应用",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              BrnSearchText(
                focusNode: focusNode,
                hintText: '搜索应用',
                controller: textController,
                //searchController: scontroller.isActionShow = true,
                onTextClear: () {
                  return false;
                },
                autoFocus: false,
                onActionTap: () {
                  //scontroller.isClearShow = false;
                  //scontroller.isActionShow = false;
                  focusNode.unfocus();
                  //BrnToast.show('取消', context);
                },
                onTextCommit: (text) {
                  //BrnToast.show('提交内容 : $text', context);
                },
                onTextChange: (text) {
                  //BrnToast.show('输入内容 : $text!!', context);
                  _runFilter(text);
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              //应用列表视图
              Expanded(
                child: ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => newdetail(
                                appName: _foundUsers[index]['title'],
                                appImg: _foundUsers[index]['imageUrl'],note: _foundUsers[index]['note'],)));
                        //print('点击了'+_foundUsers[index]['title']);
                      },
                      leading: Container(
                        width: 13.w,
                        height: 13.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(_foundUsers[index]['imageUrl']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(_foundUsers[index]['title']),
                      subtitle: Text(_foundUsers[index]['note']),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ));
    ;
  }
}

//示例数据
List _listDatas = [
  {
    "title": '添加自定义APP',
    "note": '自定义名称和图标吧！',
    "imageUrl": 'https://ccrice.top/2022/07/31/13f3f1fa1ec1e.png',
  },
  {
    "title": 'QQ音乐',
    "note": "听我想听的歌",
    "imageUrl": 'https://ccrice.top/2022/07/31/34dd7260605cf.jpg',
  },
  {
    "title": '知乎',
    "note": "刚下飞机...",
    "imageUrl": 'https://ccrice.top/2022/07/31/71c728b8ac470.jpg',
  },
  {
    "title": 'QQ',
    "note": "QQ大会员你值得拥有",
    "imageUrl": 'https://ccrice.top/2022/07/31/902f1307e7987.jpg',
  },
  {
    "title": '网易云音乐',
    "note": "相信音乐的力量",
    "imageUrl": 'https://ccrice.top/2022/07/31/7c113c1b308fe.jpg',
  },
  {
    "title": '哔哩哔哩',
    "note": "B站永远不会变质",
    "imageUrl": 'https://ccrice.top/2022/07/31/30b816f8efe4f.jpg',
  },
];
