import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_juejin/model/indexCell.dart';

class DataUtils {
  ///加载json
  static Future<String> _getAssetsJson() async {
    return await rootBundle.loadString('assets/indexListData.json');
  }

  ///从json中反序列化数据列表
  static Future<List<IndexCell>> getIndexCellListData() async {
    String jsonData = await _getAssetsJson();
    List<IndexCell> cellList = new List();
    final jsonArray = json.decode(jsonData)['indexListData'] as List;
    for (int i = 0; i < jsonArray.length; i++) {
      cellList.add(IndexCell.fromJson(jsonArray[i]));
    }
    return cellList;
  }
}
