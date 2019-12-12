import 'package:flutter/material.dart';
import 'package:flutter_juejin/pages/my_app.dart';
import 'package:flutter_juejin/routers/fluro_routers.dart';

void main() {
  FluroRouters.setUpRouter();
  runApp(MyApp());
}


