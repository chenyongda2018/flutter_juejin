
import 'package:flutter_juejin/util/dateUtils.dart';

class IndexCell {

  bool hot;
  String type;
  String tag;
  String username;
  int collectionCount;
  int commentCount;
  String title;
  String createdTime;
  String detailUrl;

  IndexCell(
      {this.hot,
        this.tag,
        this.username,
        this.collectionCount,
        this.createdTime,
        this.commentCount,
        this.title,
        this.detailUrl,
        this.type});


  factory IndexCell.fromJson(Map<String, dynamic> json) {
    return IndexCell(
      hot: json['hot'],
      collectionCount: json['collectionCount'],
      commentCount: json['commentsCount'],
      tag: json['tags'][0]['title'] + '/' + json['category']['name'],
      username: json['user']['username'],
      createdTime: DateUtils.getTimeDuration(json['createdAt']),
      title: json['title'],
      detailUrl: json['originalUrl'],
      type: json['type'] ,
    );
  }

}