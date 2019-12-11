import 'package:flutter/material.dart';
import 'package:flutter_juejin/model/indexCell.dart';
import 'package:flutter_juejin/widgets/goodOrCommentCell.dart';
import 'package:flutter_juejin/widgets/textDot.dart';

class IndexListCell extends StatelessWidget {
  IndexCell cellInfo;

  IndexListCell({Key key, @required this.cellInfo}) : super(key: key);

  TextStyle titleTextStyle = TextStyle(
    color: Color(0xFFB2BAC2),
    fontWeight: FontWeight.w300,
    fontSize: 13.0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //第一行子标题
          Container(
            height: 20.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _buildListCellSubTitle(),
            ),
          ),

          //主标题
          Container(
            margin: EdgeInsets.symmetric(vertical: 9.0),
            child: Text(
              cellInfo.title,
              style: TextStyle(
                color: Color(0xFF393C3F),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          //点赞
          GoodAndCommentCell(
              cellInfo.collectionCount,
               cellInfo.commentCount),
          SizedBox(
            height: 15.0,
          ),
          Divider(
            height: 2.0,
          )
        ],
      ),
    );
  }

  List<Widget> _buildListCellSubTitle() {
    List<Widget> list = new List();
    if (cellInfo.hot) {
      list.add(new Text(
        '热',
        style: TextStyle(
          color: Color(0xFFF53040),
          fontWeight: FontWeight.w600,
        ),
      ));

      list.add(TextDot());
    }

    if ('post' == cellInfo.type) {
      list.add(new Text(
        '专栏',
        style: TextStyle(
          color: Color(0xFFBC30DA),
          fontWeight: FontWeight.w600,
        ),
      ));
      list.add(TextDot());
    }

    list.add(Text(
      cellInfo.username,
      style: titleTextStyle,
    ));
    list.add(TextDot());

    list.add(Text(
      cellInfo.createdTime,
      style: titleTextStyle,
    ));
    list.add(TextDot());

    list.add(Expanded(
      child: Text(
        cellInfo.tag,
        style: titleTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
    ));

    return list;
  }
}
