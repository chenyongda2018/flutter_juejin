
import 'package:flutter/material.dart';

///文章内容页面
class ArticleDetail extends StatelessWidget {
  
  final String articleId;
  final String title;


  ArticleDetail(this.articleId,this.title);
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title:Text(title),
      ),
      body: Center(
        child: Text(
          articleId.toString()+"\n"+title
        ),
      ),
    );
  }
  
}