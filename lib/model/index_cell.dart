
import 'package:flutter_juejin/util/date_utils.dart';

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
    String _tags = '';
    List<dynamic> tags = json['tags'];
    if(tags.isNotEmpty) {
      _tags = '${json['tags'][0]['title']}/';
    }
    return IndexCell(
      hot: json['hot'],
      collectionCount: json['collectionCount'],
      commentCount: json['commentsCount'],
      tag: '$_tags${json['category']['name']}',
      username: json['user']['username'],
      createdTime: DateUtils.getTimeDuration(json['createdAt']),
      title: json['title'],
      detailUrl: json['originalUrl'],
      type: json['type'] ,
    );
  }

}