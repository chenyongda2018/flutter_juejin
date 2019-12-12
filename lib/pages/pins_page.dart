import 'package:flutter/material.dart';
import 'package:flutter_juejin/model/pins_cell.dart';
import 'package:flutter_juejin/util/data_utils.dart';

///沸点页面
class PinsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PinsPageState();
  }

}

class _PinsPageState extends State<PinsPage> {

  List<PinsCell> _resultList;
  bool _hasMore = true;
  bool _isRequesting = false;


  String before = '';

  Map<String, dynamic> _params = {
    'src': 'web',
    'uid': "",
    'limit': 20,
    'device_id': "",
    "token": ""
  };

  ScrollController _scrollController = new ScrollController();


  @override
  void initState() {
    _getPinsData(false);
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getPinsData(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_resultList.length > 0) {
      return Container(
        color: Color(0xFFF4F5F5),
        child: ListView.builder(
          itemBuilder:,
          itemCount: _resultList.length + 1,
          controller: _scrollController,
        ),
      );
    }
    return Center(
        child : CircularProgressIndicator(),
    );
  }

  void _getPinsData(bool isLoadMore) {
    if (_isRequesting || !_hasMore) return;
    _isRequesting = true;
    if (before != '') {
      _params['before'] = before;
    }

    if (!isLoadMore) {
      _params['before'] = '';
    }
    before = DateTime.now().toString().replaceFirst(RegExp(r' '), 'T') + 'Z';

    DataUtils.getPinsListDate(_params).then((resultList) {
      List<PinsCell> pinsList = new List();
      if (isLoadMore) {
        pinsList.addAll(_resultList);
      }
      pinsList.addAll(resultList);
      if (this.mounted) {
        setState(() {
          _isRequesting = false;
          _resultList = pinsList;
          _hasMore = _resultList.length > 0;
        });
      }
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

}