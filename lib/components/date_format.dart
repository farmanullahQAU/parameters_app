import 'package:intl/intl.dart';

class DateFormatter{


   static String getFormatedDate(DateTime dateTime) {

    return DateFormat().add_Hm().format(dateTime);
  }
}