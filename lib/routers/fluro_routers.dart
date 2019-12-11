

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_juejin/pages/article_detail.dart';

class FluroRouters {
  static Router router;

  static String root = '/';
  static String articleDetails = '/detail';

  FluroRouters() {
    router = new Router();
    setUpRouter(router);
  }

  static Handler articleDetailHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params) {
      String articleId = params['id']?.first;
      String title = params['title']?.first;
      return ArticleDetail(articleId, title);
    }
  );


  static void setUpRouter(Router router) {
    router.define(articleDetails, handler: articleDetailHandler);
  }
}