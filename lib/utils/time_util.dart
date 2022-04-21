class TimeUtil{
  static String getTimeStr(int time){
    final dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    final now = DateTime.now();
    var start = 0;
    if (now.year == dateTime.year) {
      if (now.month == dateTime.month) {
        if (now.day == dateTime.day) {
          start = 11;
        }
      }
    }
    final timeStr = dateTime.toLocal().toString();
    return timeStr.substring(start, 16);
  }
}