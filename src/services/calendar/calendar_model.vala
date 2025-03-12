namespace Multicalendar {

    public abstract class CalendarField {
        public const string calendar = "calendar";
        public const string year = "year";
        public const string month = "month";
        public const string day = "day";
        public const string week = "week";
        public const string day_year = "day_year";
    }

        public class CalendarModel {
        public string calendar;
        public string year;
        public string month;
        public string day;
        public string week;
        public string day_year;

        public CalendarModel(string _calendar, string _year, string _month, string _day,
                        string _week, string _day_year ) {
            calendar = _calendar;
            year = _year;
            month = _month;
            day = _day;
            week = _week;
            day_year = _day_year;

        }

        public CalendarModel.fromJson (Json.Node item) {
//            CalendarField calendarField = new CalendarField();

            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case CalendarField.calendar:
                        unowned Json.Node it = obj.get_member (name);
                        calendar = obj.get_string_member (CalendarField.calendar);
                        message(calendar);
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
                    case CalendarField.day_year:
                        unowned Json.Node it = obj.get_member (name);
                        day_year = obj.get_string_member (CalendarField.day_year);
                        message(day_year);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}

