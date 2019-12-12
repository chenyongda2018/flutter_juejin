


import 'package:flutter/material.dart';
import 'package:flutter_juejin/constants/constants.dart';
import 'package:flutter_juejin/model/index_cell.dart';
import 'package:flutter_juejin/util/data_utils.dart';
import 'package:flutter_juejin/widgets/indexListCell.dart';
import 'package:flutter_juejin/widgets/indexListHeader.dart';

///主页面
class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPageState();
  }

}

class _IndexPageState extends State<IndexPage> {

  List<IndexCell> _resultList;
  Map<String,dynamic> _params = {
    'src' : 'web',
    'category' : 'all',
    'limit' : 20,

  };
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

  int _pageIndex = 0;


  _getResultList(bool isLoadMore) {
    if(!isLoadMore) {
      _pageIndex = 0;
    }
    _params['before'] = Constants.RANK_BEFORE[_pageIndex];
    DataUtils.getIndexCellListData(_params).then((resultList) {
      setState(() {
        _resultList = resultList;
      });
    });
  }
}