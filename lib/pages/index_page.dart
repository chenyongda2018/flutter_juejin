


import 'package:flutter/material.dart';
import 'package:flutter_juejin/model/index_cell.dart';
import 'package:flutter_juejin/util/dataUtils.dart';
import 'package:flutter_juejin/widgets/indexListCell.dart';
import 'package:flutter_juejin/widgets/indexListHeader.dart';

///活动页面
class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPageState();
  }

}

class _IndexPageState extends State<IndexPage> {

  List<IndexCell> _resultList;

  _renderList(context,index) {
    if(index == 0) {
      return IndexListHeader(false);
    } else {
      return IndexListCell(cellInfo: _resultList[index-1]);
    }
  }

  @override
  void initState() {
    super.initState();
    _getResultList(false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(_resultList.length == 0) {
      return Center(
        child : CircularProgressIndicator(),
      );
    }
    return ListView.builder(
        itemCount: _resultList.length+1,
        itemBuilder:(context,index) => _renderList(context, index)
    );
  }



  _getResultList(bool isLoadMore) {
    DataUtils.getIndexCellListData().then((resultList) {
      setState(() {
        _resultList = resultList;
      });
    });
  }
}