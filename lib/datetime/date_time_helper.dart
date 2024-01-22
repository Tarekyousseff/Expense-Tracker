// convert DateTime object to a String yyymmdd
String convertDateTimeToString(DateTime dateTime) {
  // year in the format -> yyy
  String year = dateTime.year.toString();
  // month is the format -> mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }
  // day is the format -> dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }
  // final format -> yyymmdd
  String yyymmdd = year + month + day;
  return yyymmdd;
}
