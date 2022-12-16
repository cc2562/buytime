import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bruno/bruno.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:date_format/date_format.dart';
//日期处理
//图片选择
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';
List templist = [
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

//编辑器配置
class newdetail extends StatefulWidget {
  late final String appName;
  late final String appImg;

  late final String note;




  newdetail(
      {Key? key,
      this.appImg = 'https://ccrice.top/2022/07/31/13f3f1fa1ec1e.png',
      this.appName = '',this.note = ''})
      : super(key: key);

  @override
  State<newdetail> createState() => _newdetailState();
}


class _newdetailState extends State<newdetail> {
  late File imagepath;
  var imm;

  @override
  void initState() {
    // TODO: implement initState
    print(widget.appName);
    print(widget.appImg);
    var _AppsName = widget.appName;
    if(widget.appName!="添加自定义APP"){
      setAPPName(widget.appName);
    }

    var _Notes = widget.note;
    if(widget.appName!="添加自定义APP"){
      setNote(widget.note);
    }


    super.initState();
  }


  void setAPPName(String flagText){
    appname.text = flagText;
  }
  void setNote(String flagText){
    appnote.text = flagText;
  }
  var _nowAppName;
  var _nowNote;
  TextEditingController appname = TextEditingController();
  TextEditingController appnote = TextEditingController();
  TextEditingController appcoast = TextEditingController();
  //编辑框配置内容
  Widget AppNameView(){

    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: appname,
      decoration: const InputDecoration(border: InputBorder.none,
        hintText:"输入应用名",
      ),
      onChanged:  (Text){
        setState((){
          _nowAppName =Text;
        });
      },
    );
  }
  Widget NoteView(){
    return TextFormField(
        textInputAction: TextInputAction.next,
        controller: appnote,
        decoration: const InputDecoration(border: InputBorder.none,
          hintText:"留下点什么吧",

        ),
        onChanged:  (Text){
          setState((){
            _nowNote =Text;
          });
        },
      );
  }
  Widget CoastView(){
    return TextFormField(
        controller: appcoast,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9.]")),

        ],
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(border: InputBorder.none,
          hintText:"单位CNY",
        ),
        onChanged:  (Text){
          setState((){
            //_nowNote =Text;
          });
        },
      );
  }
  var appbuytime = DateTime.now();

  final List<String> _list = ["你哈","12222"];


  Widget test(){
    return Card(

      child: BrnNormalFormGroup(
        title: "普通分组",
        children: [
          BrnTextInputFormItem(
            title: "应用名",
            controller: appname,
            hint: "请输入",
            onChanged: (Text) {
              setState((){
                _nowAppName =Text;
              });
            },
          ),
          BrnTextInputFormItem(
            title: "订阅价格(CNY)",
            hint: "请输入",
            controller: appcoast,
            onChanged: (Text) {
              setState((){

              });
            },
          ),
          BrnTextInputFormItem(
            title: "备注",
            controller: appnote,
            hint: "请输入",
            onChanged: (Text) {
              setState((){
                _nowNote =Text;
              });
            },
          ),
          BrnTitleFormItem(
            title: '订阅时间',
            operationLabel: formatDate(DateTime.now(), [yyyy, '年', mm, '月', dd,'日']),
            onTip: () {
              BrnToast.show("点击触发回调_onTip", context);
            },
            onTap: () {
              BrnToast.show("点击触发回调_onTap", context);
            },
          ),
          BrnTitleFormItem(
            title: '订阅类型',
            operationLabel: '月付',
            onTip: () {
              BrnToast.show("点击触发回调_onTip", context);
            },
            onTap: () {
              BrnToast.show("点击触发回调_onTap", context);
            },
          ),
          BrnTitleSelectInputFormItem(selectList: _list)
        ],
      ),
    );

  }
  //图标配置
  Widget AppIcon() {
    if (imm == null) {
      return Container(
        width: 20.w,
        height: 20.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(widget.appName == "添加自定义APP"
                  ? 'https://ccrice.top/2022/07/31/c6617c28f4f8c.png'
                  : widget.appImg),
              fit: BoxFit.cover,
            )),
      );
    } else {
      print(imagepath);
      return Container(
        width: 20.w,
        height: 20.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: FileImage(imagepath),
              fit: BoxFit.cover,
            )),
      );

      //Image.file(imagepath);
    }
  }
  bool _flags= false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(child: Column(
                  children: [
                    BrnAppBar(
                      //默认显示返回按钮
                      automaticallyImplyLeading: true,
                      brightness: Brightness.light,
                      title: '添加订阅',
                      //自定义的右侧文本
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        InkWell(
                            child: AppIcon(),
                            onTap: () {
                              final ImagePicker _picker = ImagePicker();
                              _openGallery() async {
                                var image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  imagepath = File(image!.path);
                                  imm = image;
                                });
                              }

                              ;
                              _openGallery();
                            })
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text(
                            _nowAppName == null
                                ? widget.appName
                                : _nowAppName,
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),

                    Padding(padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: test(),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child:Container(
                        width: double.infinity,
                        height: 6.h,
                        child:Row(
                          children: [
                            Center(
                              child: Text('订阅类型'),
                            ),
                            SizedBox(width: 2.w,),
                            Center(
                            child: ToggleSwitch(
                              minHeight: 6.h,
                              fontSize: 16.0,
                              initialLabelIndex: 1,
                              activeBgColor: [Color.fromARGB(255,255, 180, 180)],
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey.shade100,
                              inactiveFgColor: Colors.grey[900],
                              totalSwitches: 3,
                              labels: ['月付', '年付', '永久'],
                              onToggle: (index) {
                                print('switched to: $index');
                              },
                            ),
                          )
                          ],
                        )




                      ),
                    ),
                  ],
                )),


              ],
            ),
          )
        ],
      ),
    );
  }
}
