


import 'package:flutter/material.dart';
import 'package:flutter_juejin/model/indexCell.dart';
import 'package:flutter_juejin/util/dataUtils.dart';
import 'package:flutter_juejin/widgets/indexListCell.dart';

///活动页面
class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPageState();
  }

}

class _IndexPageState extends State<IndexPage> {

  List<IndexCell> _reslutList;


  @override
  void initState() {
    super.initState();
    _getResultList(false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Text('indexPage'),
        IndexListCell(cellInfo: _reslutList[0]),
      ],
    );
  }



  _getResultList(bool isLoadMore) {
    DataUtils.getIndexCellListData().then((resultList) {
      setState(() {
        _reslutList = resultList;
      });
    });
  }
}