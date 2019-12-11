

class DateUtils {

  ///将当前时间与给定时间对比,返回对应tips
  static String getTimeDuration(String time) {

    var oldTime = DateTime.parse(time);
    var nowTime = DateTime.now();
    Duration duration = nowTime.difference(oldTime);
    if(duration.inMinutes < 1) return "片刻之间";
    if(duration.inHours < 1) return duration.inMinutes.toString()+"分钟之前";
    if(duration.inDays < 1) return duration.inHours.toString()+"小时之前";
    return duration.inDays.toString()+"天之前";
  }



}