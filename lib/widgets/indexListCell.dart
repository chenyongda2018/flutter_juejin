


import 'package:flutter/material.dart';
import 'package:flutter_juejin/model/indexCell.dart';

class IndexListCell extends StatelessWidget {

  IndexCell cellInfo;

  IndexListCell({Key key,@required this.cellInfo}): super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Text(
          cellInfo.username
      ),
    );
  }

}