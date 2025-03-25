namespace Multicalendar {

    public abstract class CalendarField {
        public const string calendar = "calendar";
        public const string image = "image";
        public const string font = "font";
        public const string year = "year";
        public const string month = "month";
        public const string day = "day";
        public const string week = "week";
        public const string dayOfYear = "day_of_year";
        public const string daysInYear = "days_in_year";
        public const string daysInMonth = "days_in_month";
        public const string isLeap = "is_leap";
        public const string monthName = "month_name";
        public const string monthNameNum = "month_name_num";
        public const string dayName = "day_name";
        public const string dayTranslateName = "day_translate_name";
        public const string firstDayExoticMonth = "first_day_exotic_month";
        public const string firstWeekExoticMonth = "first_week_exotic_month";
        public const string shortNameDay = "short_name_day";
    }

    public class CalendarModel {
        public string calendar;
        public string image;
        public string font;
        public string year;
        public string month;
        public string day;
        public string week;
        public string dayOfYear;
        public string daysInYear;
        public string daysInMonth;
        public string isLeap;
        public string monthName;
        public string monthNameNum;
        public string dayName;
        public string dayTranslateName;
        public string firstDayExoticMonth;
        public string firstWeekExoticMonth;
        public Gee.ArrayList<string> shortNameDay;
        //public Gtk.StringList shortNameDay;
        //public Json.Array shortNameDay;

        public CalendarModel(string _calendar, string _image, string _font,
                        string _year, string _month, string _day,
                        string _week, string _dayOfYear, string _daysInYear, string _daysInMonth,
                        string _isLeap,
                        string _monthName, string _monthNameNum,
                        string _dayName, string _dayTranslateName,
                        string _firstDayExoticMonth, string _firstWeekExoticMonth,
                        Gee.ArrayList<string> _shortNameDay)
                        //Gtk.StringList _shortNameDay)
                        //Json.Array _shortNameDay)
        {
            calendar = _calendar;
            image = _image;
            font = _font;
            year = _year;
            month = _month;
            day = _day;
            week = _week;
            dayOfYear = _dayOfYear;
            daysInYear = _daysInYear;
            daysInMonth = _daysInMonth;
            isLeap = _isLeap;
            monthName = _monthName;
            monthNameNum = _monthNameNum;
            dayName = _dayName;
            dayTranslateName = _dayTranslateName;
            firstDayExoticMonth = _firstDayExoticMonth;
            firstWeekExoticMonth = _firstWeekExoticMonth;
            shortNameDay = _shortNameDay;
        }

        public CalendarModel.fromJson (Json.Node item) {
//            CalendarField calendarField = new CalendarField();
            //Gtk.StringList shortNameDay = new Gtk.StringList([]);
            shortNameDay = new Gee.ArrayList<string>();

            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case CalendarField.calendar:
                        unowned Json.Node it = obj.get_member (name);
                        calendar = obj.get_string_member (CalendarField.calendar);
                        message(calendar);
                        break;
                    case CalendarField.image:
                        unowned Json.Node it = obj.get_member (name);
                        image = obj.get_string_member (CalendarField.image);
                        message(image);
                        break;
                    case CalendarField.font:
                        unowned Json.Node it = obj.get_member (name);
                        font = obj.get_string_member (CalendarField.font);
                        message(font);
                        break;
                    case CalendarField.year:
                        unowned Json.Node it = obj.get_member (name);
                        year = obj.get_string_member (CalendarField.year);
                        message(year);
                        break;
                    case Calendar0Field.month:
                        unowned Json.Node it = obj.get_member (name);
                        month = obj.get_string_member (CalendarField.month);
                        message (month);
                        break;
                    case CalendarField.day:
                        unowned Json.Node it = obj.get_member (name);
                        day = obj.get_string_member (CalendarField.day);
                        message (day);
                        break;
                    case CalendarField.week:
                        unowned Json.Node it = obj.get_member (name);
                        week = obj.get_string_member (CalendarField.week);
                        message(week);
                        break;
                    case CalendarField.dayOfYear:
                        unowned Json.Node it = obj.get_member (name);
                        dayOfYear = obj.get_string_member (CalendarField.dayOfYear);
                        message(dayOfYear);
                        break;
                    case CalendarField.daysInYear:
                        unowned Json.Node it = obj.get_member (name);
                        daysInYear = obj.get_string_member (CalendarField.daysInYear);
                        message(daysInYear);
                        break;
                    case CalendarField.daysInMonth:
                        unowned Json.Node it = obj.get_member (name);
                        daysInMonth = obj.get_string_member (CalendarField.daysInMonth);
                        message(daysInMonth);
                        break;
                    case CalendarField.isLeap:
                        unowned Json.Node it = obj.get_member (name);
                        isLeap = obj.get_string_member (CalendarField.isLeap);
                        message(isLeap);
                        break;
                    case CalendarField.monthName:
                        unowned Json.Node it = obj.get_member (name);
                        monthName = obj.get_string_member (CalendarField.monthName);
                        message(monthName);
                        break;
                    case CalendarField.monthNameNum:
                        unowned Json.Node it = obj.get_member (name);
                        monthNameNum = obj.get_string_member (CalendarField.monthNameNum);
                        message(monthNameNum);
                        break;
                    case CalendarField.dayName:
                        unowned Json.Node it = obj.get_member (name);
                        dayName = obj.get_string_member (CalendarField.dayName);
                        message(dayName);
                        break;
                    case CalendarField.dayTranslateName:
                        unowned Json.Node it = obj.get_member (name);
                        dayTranslateName = obj.get_string_member (CalendarField.dayTranslateName);
                        message(dayTranslateName);
                        break;
                    case CalendarField.firstDayExoticMonth:
                        unowned Json.Node it = obj.get_member (name);
                        firstDayExoticMonth = obj.get_string_member (CalendarField.firstDayExoticMonth);
                        message(firstDayExoticMonth);
                        break;
                    case CalendarField.firstWeekExoticMonth:
                        unowned Json.Node it = obj.get_member (name);
                        firstWeekExoticMonth = obj.get_string_member (CalendarField.firstWeekExoticMonth);
                        message(firstWeekExoticMonth);
                        break;
                    case CalendarField.shortNameDay:
                        unowned Json.Node it = obj.get_member (name);
                        Json.Array jsonArrayShortNameDay = obj.get_array_member (CalendarField.shortNameDay);
                        //message(shortNameDay.get_string_element (0));
//                        parseJsonArray (jsonArrayShortNameDay, shortNameDay);
//                        shortNameDay.clear ();
                        int64 count = jsonArrayShortNameDay.get_length ();
                        message (count.to_string());
                        for(int i = 0;i<count;i++) {
//                            shortNameDay.append ("jsonArrayShortNameDay.get_string_element (i)");
                            shortNameDay.add (jsonArrayShortNameDay.get_string_element (i));
                        }
//                        for(int i = 0;i<shortNameDay.get_n_items();i++) {
  //                          message(shortNameDay.get_string(i));
    //                    }

                        for(int i = 0;i<shortNameDay.size;i++) {
                            message(shortNameDay[i]);
                        }
                        break;
                    default:
                        break;
                }
            }
        }

        private void parseJsonArray (Json.Array arr, Gee.ArrayList<string> list) {
            list.clear ();
            int64 count = arr.get_length ();
            for(int i = 0;i<count;i++) {
                list.add (arr.get_string_element (i));
//                message(arr.get_string_element (i));
            }
        }
    }
}

