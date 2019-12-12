
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

///文章详情页面
class ArticleDetail extends StatefulWidget {
  
  final String articleId;
  final String title;

  ArticleDetail(this.articleId,this.title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ArticleDetailState();
  }
  
}

class _ArticleDetailState extends State<ArticleDetail> {

  FlutterWebviewPlugin _webviewPlugin = new FlutterWebviewPlugin();

  bool _hasLoad = false;
//  @override
//  void initState() {
//    _webviewPlugin.onStateChanged.listen((state) {
//      if(state.type == WebViewState.finishLoad) {
//        setState(() {
//          _hasLoad = true;
//        });
//      }
//    });
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(widget.articleId);
    return WebviewScaffold(
      url: widget.articleId,
      appBar: AppBar(
        title : Text(widget.title)
      ),
      withZoom: false,
      withJavascript: true,
      withLocalStorage: true,
    );
  }

}

