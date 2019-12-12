

import 'package:flutter/material.dart';

class TextDot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: 3.0,
      height: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(3.0))
      ),
    );
  }

}