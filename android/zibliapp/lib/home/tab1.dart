import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';

//
import 'package:glassmorphism/glassmorphism.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

//渐变颜色
import 'package:carousel_slider/carousel_slider.dart';

//幻灯片
class tab1page extends StatefulWidget {
  const tab1page({Key? key}) : super(key: key);

  @override
  State<tab1page> createState() => _tab1pageState();
}

List imageList = [
  "https://www.applover.cn/wp-content/uploads/2022/08/photo_2022-08-06_21-59-25.jpg",
  "https://www.applover.cn/wp-content/uploads/2022/08/photo_2022-08-06_21-59-35.jpg",
  "https://www.applover.cn/wp-content/uploads/2022/08/photo_2022-08-06_21-59-41.jpg",
];
var controller = new PageController();

class _tab1pageState extends State<tab1page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DraggableHome(
      //leading: const Icon(Icons.arrow_back_ios),
      title: Text('首页'),
      headerWidget: Container(
          decoration: BoxDecoration(color: Color(0xffFCF8E8)),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Image.network(
                "https://oss.zibll.com/zibll.com/2021/10/ZIBLL-LOGO-白天.png",
                height: 45,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
                child: GlassmorphicContainer(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    borderRadius: 20,
                    blur: 20,
                    padding: EdgeInsets.all(40),
                    alignment: Alignment.bottomCenter,
                    border: 0,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.4),
                          Color(0xFFffffff).withOpacity(0.4),
                        ],
                        stops: [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.5),
                        Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey.shade300)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '开始搜索吧',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey.shade300,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 100,
                child: ListView(
                  //顶部模块1
                  scrollDirection: Axis.horizontal,
                  children: [
                    GlassmorphicContainer(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        width: 200,
                        height: 100,
                        borderRadius: 20,
                        blur: 20,
                        padding: EdgeInsets.all(40),
                        alignment: Alignment.bottomCenter,
                        border: 0,
                        linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFfda085).withOpacity(0.4),
                              Color(0xFFf6d365).withOpacity(0.4),
                            ],
                            stops: [
                              0.1,
                              1,
                            ]),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.5),
                            Color((0xFFFFFFFF)).withOpacity(0.5),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_fire_department_outlined,
                                    color: Colors.redAccent.shade200,
                                    size: 80,
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '热门内容',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('关注新鲜事',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )
                            ],
                          ),
                        )),
                    GlassmorphicContainer(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        width: 200,
                        height: 100,
                        borderRadius: 20,
                        blur: 20,
                        padding: EdgeInsets.all(40),
                        alignment: Alignment.bottomCenter,
                        border: 0,
                        linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFfbc2eb).withOpacity(0.2),
                              Color(0xFFe6dee9).withOpacity(0.2),
                            ],
                            stops: [
                              0.1,
                              1,
                            ]),
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFffffff).withOpacity(0.5),
                            Color((0xFFFFFFFF)).withOpacity(0.5),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow.shade200,
                                    size: 80,
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '宝藏合集',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('为你精心推荐',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          )),
      body: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
          child: Column(
            children: [
              //幻灯片
              CarouselSlider(
                options: CarouselOptions(
                    height: 200.0, enlargeCenterPage: true, aspectRatio: 2.0),
                items: [0, 1, 2].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          //圆角方法一
                          image: DecorationImage(
                            image: NetworkImage(imageList[i]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              //Text('主页',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              //首页TAB
              Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 0),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: Container(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Column(
                              children: [
                                AspectRatio(aspectRatio: 2/1,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                  child: Image.network(
                                    'https://www.applover.cn/wp-content/uploads/2022/06/Eraser.jpg',
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),

                                Text('而啊哈哈哈哈哈哈哈')
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
