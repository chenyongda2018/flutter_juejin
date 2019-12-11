
import 'package:flutter/material.dart';
import 'package:flutter_juejin/pages/bookp_age.dart';
import 'package:flutter_juejin/pages/index_page.dart';
import 'package:flutter_juejin/pages/pins_page.dart';
import 'package:flutter_juejin/pages/repos_page.dart';

import 'activity_page.dart';

///主页面
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  //未选中时tab的颜色
  final TextStyle tabTextStyleNormal =
      TextStyle(color: const Color(0xffdddddd));
  //选中时tab的颜色
  final TextStyle tabTextStyleSelected =
      TextStyle(color: const Color(0xff4d91fd));

  //底部tab列表
  final List<Tab> _bottomTab = <Tab>[
    new Tab(
      text: '首页',
      icon: Icon(Icons.home),
    ),
    new Tab(
      text: '沸点',
      icon: Icon(Icons.chat),
    ),
    new Tab(
      text: '小册',
      icon: Icon(Icons.book),
    ),
    new Tab(
      text: '开源库',
      icon: Icon(Icons.bubble_chart),
    ),
    new Tab(
      text: '活动',
      icon: Icon(Icons.local_activity),
    ),
  ];

  var _body;
  List _appBarTitles = ['首页', '沸点', '小册', '开源库', '活动'];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: _appBarTitles.length, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: MaterialApp(
          theme: ThemeData(
              primaryColor: const Color.fromRGBO(77, 145, 253, 1.0)
          ),
          home: new Scaffold(
            appBar: AppBar(
              title: Text('Title'),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                IndexPage(),
                PinsPage(),
                BookPage(),
                ReposPage(),
                ActivityPage(),
              ],
            ),
            bottomNavigationBar: new Material(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                  tabs: _bottomTab,
                  controller: _tabController,
                  indicatorColor: Colors.white,
              ),
            ),
          ),
        ),
    );
  }

}