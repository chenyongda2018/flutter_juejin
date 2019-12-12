import 'package:flutter/material.dart';

class LoadMore extends StatelessWidget {
  bool _hasMore;

  LoadMore(this._hasMore);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_hasMore) {
      return Container(
        height: 50.0,
        child: Center(
          child: Opacity(
            opacity: 1.0,
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
            ),
          ),
        ),
      );
    }
    return Container(
      height: 50.0,
      child: Center(
        child: Text(
          '亲,已经没有了~',
          style: TextStyle(
            color: Theme.of(context).accentColor
          ),
        ),
      ),
    );
  }
}
