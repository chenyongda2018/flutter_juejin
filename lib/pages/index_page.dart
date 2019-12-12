import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_juejin/constants/constants.dart';
import 'package:flutter_juejin/model/index_cell.dart';
import 'package:flutter_juejin/util/data_utils.dart';
import 'package:flutter_juejin/widgets/index_list_cell.dart';
import 'package:flutter_juejin/widgets/indexL_list_header_widget.dart';
import 'package:flutter_juejin/widgets/load_more_widget.dart';

///主页面
class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
  int _pageIndex = 0;
  List<IndexCell> _resultList;
  bool _hasMore = true;
  bool _isRequesting = false;
  Map<String, dynamic> _params = {
    'src': 'web',
    'category': 'all',
    'limit': 20,
  };

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _getResultList(false);
    _scrollController.addListener(() {
      //对滑动页面是否已经到了最低端的检测
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getResultList(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_resultList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: _resultList.length + 2,
        itemBuilder: (context, index) => _renderListWidget(context, index),
        controller: _scrollController,
      ),
      onRefresh: _onRefresh,
    );
  }

  _getResultList(bool isLoadMore) {
    if (_isRequesting || !_hasMore) return;
    if (!isLoadMore) {
      _pageIndex = 0;
    }
    _params['before'] = Constants.RANK_BEFORE[_pageIndex];
    _isRequesting = true;
    DataUtils.getIndexCellListData(_params).then((resultList) {
      _pageIndex += 1;
      List<IndexCell> allData = new List();

      if (isLoadMore) {
        allData.addAll(_resultList);
      }
      allData.addAll(resultList);
      setState(() {
        _resultList = allData;
        _isRequesting = false;
        _hasMore = _pageIndex < Constants.RANK_BEFORE.length;
      });
    });
  }

  _renderListWidget(context, index) {
    if (index == 0) {
      return IndexListHeader(false);
    } else if (index == _resultList.length + 1) {
      return LoadMore(_hasMore);
    } else {
      return IndexListCell(cellInfo: _resultList[index - 1]);
    }
  }

  Future<void> _onRefresh() async {
    _resultList.clear();
    setState(() {
      _resultList = _resultList;
      _hasMore = true;
    });
    _getResultList(false);
    return null;
  }
}
