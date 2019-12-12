
import 'package:http/http.dart' as http;
///网络请求封装类
class HttpUtil {

  static Future<String> get(String url,{Map<String,String> params})  async{
    if(params != null && params.isNotEmpty) {
      StringBuffer paramsStr = new StringBuffer();
      params.forEach((key,value) {
        paramsStr.write("$key"+"="+"$value"+"&");
      });
      String s = paramsStr.toString().substring(0,paramsStr.length-1);//去掉最后一个&
      url +=s;
      http.Response res = await http.get(url);
      return res.body;
    }
  }


  static Future<String> post(String url,{Map<String,String> params}) async {
    http.Response res = await http.post(url,body: params);
    return res.body;
  }
}