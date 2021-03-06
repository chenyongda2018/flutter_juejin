import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_juejin/api/api.dart';
import 'package:flutter_juejin/model/index_cell.dart';
import 'package:flutter_juejin/model/pins_cell.dart';
import 'package:flutter_juejin/util/dio_utils.dart';

class DataUtils {
  ///加载json
  static Future<String> _getAssetsJson() async {
    return await rootBundle.loadString('assets/indexListData.json');
  }

  ///从json中反序列化数据列表
  static Future<List<IndexCell>> getIndexCellListData(
      Map<String, dynamic> params) async {
    var response = await DioUtil.get(Api.RANK_LIST, params: params);
    var dataList = response["d"]["entrylist"];

    List<IndexCell> cellList = new List();
    for (int i = 0; i < dataList.length; i++) {
      cellList.add(IndexCell.fromJson(dataList[i]));
    }
    return cellList;
  }

  ///请求沸点的数据
  static Future<List<PinsCell>> getPinsListDate(Map<String, dynamic> params) async{
    var response = await DioUtil.get(Api.PINS_LIST,params: params);
    var resList = response['d']['list'];
    List<PinsCell> pinsList = new List();

    for(int i=0; i < resList.length;i++) {
      pinsList.add(PinsCell.fromJson(resList[i]));
    }

    return pinsList;
  }
}
