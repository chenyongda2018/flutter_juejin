

import 'package:flutter/material.dart';

///首页的头部,登陆/注册
class IndexListHeader extends StatelessWidget {

  bool isLogin;

  IndexListHeader(this.isLogin);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(!isLogin) {
      return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '热门文章',
                  style: TextStyle(
                      color: Color(0xFF434343),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                FlatButton(
                  child: Text('查看更多', style: TextStyle(color: Color(0xFF757575))),
                  onPressed: () {
                    print("查看更多");
                  },
                ),
              ],
            ),
            Divider(),
          ],
        )

      );
    }

  }

}