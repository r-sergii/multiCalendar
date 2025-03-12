namespace Multicalendar {

    public abstract class Calendar0Field {
        public const string year = "year";
        public const string month = "month";
        public const string day = "day";
        public const string month_name = "month_name";
        public const string weekday = "weekday";
        public const string weekday_name = "weekday_name";
        public const string week = "week";
        public const string calendar_name = "calendar_name";
    }

    public class Calendar0Model {
        public string year;
        public string month;
        public string day;
        public string month_name;
        public int64 weekday;
        public string weekday_name;
        public int64 week;
        public string calendar_name;

        public Calendar0Model(string _year, string _month, string _day, string _month_name,
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

        public Calendar0Model.fromJson (Json.Node item) {
//            Calendar0Field calendar0Field = new Calendar0Field();

            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case Calendar0Field.year:
                        unowned Json.Node it = obj.get_member (name);
                        year = obj.get_string_member (Calendar0Field.year);
                        message(year);
                        break;
                    case Calendar0Field.month:
                        unowned Json.Node it = obj.get_member (name);
                        month = obj.get_string_member (Calendar0Field.month);
                        message (month);
                        break;
                    case Calendar0Field.day:
                        unowned Json.Node it = obj.get_member (name);
                        day = obj.get_string_member (Calendar0Field.day);
                        message (day);
                        break;
                    case Calendar0Field.month_name:
                        unowned Json.Node it = obj.get_member (name);
                        month_name = obj.get_string_member (Calendar0Field.month_name);
                        message(month_name);
                        break;
                    case Calendar0Field.weekday:
                        unowned Json.Node it = obj.get_member (name);
                        weekday = obj.get_int_member (Calendar0Field.weekday);
                        message(weekday.to_string());
                        break;
                    case Calendar0Field.weekday_name:
                        unowned Json.Node it = obj.get_member (name);
                        weekday_name = obj.get_string_member (Calendar0Field.weekday_name);
                        message(weekday_name);
                        break;
                    case Calendar0Field.week:
                        unowned Json.Node it = obj.get_member (name);
                        week = obj.get_int_member (Calendar0Field.week);
                        message(week.to_string());
                        break;
                    case Calendar0Field.calendar_name:
                        unowned Json.Node it = obj.get_member (name);
                        calendar_name = obj.get_string_member (Calendar0Field.calendar_name);
                        message(calendar_name);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}


