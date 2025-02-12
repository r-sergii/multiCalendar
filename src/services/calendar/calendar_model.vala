namespace Multicalendar {

    class CalendarField {
        public const string year = "year";
        public const string month = "month";
        public const string day = "day";
        public const string month_name = "month_name";
        public const string weekday = "weekday";
        public const string weekday_name = "weekday_name";
        public const string week = "week";
        public const string calendar_name = "calendar_name";
    }

    public class CalendarModel {
        public string year;
        public string month;
        public string day;
        public string month_name;
        public int64 weekday;
        public string weekday_name;
        public int64 week;
        public string calendar_name;

        public CalendarModel(string _year, string _month, string _day, string _month_name,
                        int _weekday, string _weekday_name, int _week, string _calendar_name) {
            year = _year;
            month = _month;
            day = _day;
            month_name = _month_name;
            weekday = _weekday;
            weekday_name = _weekday_name;
            week = _week;
            calendar_name = _calendar_name;
        }

        public CalendarModel.fromJson (Json.Node item) {
            CalendarField calendarField = new CalendarField();

            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case calendarField.year:
                        unowned Json.Node it = obj.get_member (name);
                        year = obj.get_string_member (calendarField.year);
                        message(year);
                        break;
                    case calendarField.month:
                        unowned Json.Node it = obj.get_member (name);
                        month = obj.get_string_member (calendarField.month);
                        message (month);
                        break;
                    case calendarField.day:
                        unowned Json.Node it = obj.get_member (name);
                        day = obj.get_string_member (calendarField.day);
                        message (day);
                        break;
                    case calendarField.month_name:
                        unowned Json.Node it = obj.get_member (name);
                        month_name = obj.get_string_member (calendarField.month_name);
                        message(month_name);
                        break;
                    case calendarField.weekday:
                        unowned Json.Node it = obj.get_member (name);
                        weekday = obj.get_int_member (calendarField.weekday);
                        message(weekday.to_string());
                        break;
                    case calendarField.weekday_name:
                        unowned Json.Node it = obj.get_member (name);
                        weekday_name = obj.get_string_member (calendarField.weekday_name);
                        message(weekday_name);
                        break;
                    case calendarField.week:
                        unowned Json.Node it = obj.get_member (name);
                        week = obj.get_int_member (calendarField.week);
                        message(week.to_string());
                        break;
                    case calendarField.calendar_name:
                        unowned Json.Node it = obj.get_member (name);
                        calendar_name = obj.get_string_member (calendarField.calendar_name);
                        message(calendar_name);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}


