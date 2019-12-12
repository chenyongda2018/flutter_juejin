
import 'package:dio/dio.dart';

///使用dio进行网络请求
class DioUtil {

  static Dio dio = new Dio();
  static Future get(String url,{Map<String,dynamic> params}) async {
    var res =  await dio.get(url,data: params);
    return res.data;
  }

  static Future post(String url,{Map<String,dynamic> params}) async {
    var res =  await dio.post(url,data: params);
    return res.data;
  }

}