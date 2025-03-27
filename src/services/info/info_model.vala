namespace Multicalendar {

    public abstract class InfoField {
        public const string calendar = "calendar";
        public const string font = "font";
        public const string month = "month";
        public const string day = "day";
        public const string monthTranslate = "month_translate_name";
        public const string dayTranslate = "day_translate_name";
    }

    public class InfoModel {
        public string calendar;
        public string font;
        public Gee.ArrayList<string> month;
        public Gee.ArrayList<string> day;
        public Gee.ArrayList<string> monthTranslate;
        public Gee.ArrayList<string> dayTranslate;

        public InfoModel(string _calendar, string _font,
            Gee.ArrayList<string> _month, Gee.ArrayList<string> _day,
            Gee.ArrayList<string> _monthTranslate, Gee.ArrayList<string> _dayTranslate)
        {
            calendar = _calendar;
            font = _font;
            month = _month;
            day = _day;
            monthTranslate = _monthTranslate;
            dayTranslate = _dayTranslate;
        }

        public InfoModel.fromJson (Json.Node item) {
            month = new Gee.ArrayList<string>();
            day = new Gee.ArrayList<string>();
            monthTranslate = new Gee.ArrayList<string>();
            dayTranslate = new Gee.ArrayList<string>();

            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case InfoField.calendar:
                        unowned Json.Node it = obj.get_member (name);
                        calendar = obj.get_string_member (InfoField.calendar);
                        message(calendar);
                        break;
                    case InfoField.font:
                        unowned Json.Node it = obj.get_member (name);
                        font = obj.get_string_member (InfoField.font);
                        message(font);
                        break;
                    case InfoField.month:
                        unowned Json.Node it = obj.get_member (name);
                        Json.Array jsonArrayMonth = obj.get_array_member (InfoField.month);
                        int64 count = jsonArrayMonth.get_length ();
                        message (count.to_string());
                        for(int i = 0;i<count;i++) {
                            month.add (jsonArrayMonth.get_string_element (i));
                        }
                        for(int i = 0;i<month.size;i++) {
                            message(month[i]);
                        }
                        break;
                    case InfoField.day:
                        unowned Json.Node it = obj.get_member (name);
                        Json.Array jsonArrayDay = obj.get_array_member (InfoField.day);
                        int64 count = jsonArrayDay.get_length ();
                        message (count.to_string());
                        for(int i = 0;i<count;i++) {
                            day.add (jsonArrayDay.get_string_element (i));
                        }
                        for(int i = 0;i<day.size;i++) {
                            message(day[i]);
                        }
                        break;
                    case InfoField.monthTranslate:
                        unowned Json.Node it = obj.get_member (name);
                        Json.Array jsonArrayMonthTranslate
                            = obj.get_array_member (InfoField.monthTranslate);
                        int64 count = jsonArrayMonthTranslate.get_length ();
                        message (count.to_string());
                        for(int i = 0;i<count;i++) {
                            monthTranslate.add (jsonArrayMonthTranslate.get_string_element (i));
                        }
                        for(int i = 0;i<monthTranslate.size;i++) {
                            message(monthTranslate[i]);
                        }
                        break;
                    case InfoField.dayTranslate:
                        unowned Json.Node it = obj.get_member (name);
                        Json.Array jsonArrayDayTranslate
                            = obj.get_array_member (InfoField.dayTranslate);
                        int64 count = jsonArrayDayTranslate.get_length ();
                        message (count.to_string());
                        for(int i = 0;i<count;i++) {
                            dayTranslate.add (jsonArrayDayTranslate.get_string_element (i));
                        }
                        for(int i = 0;i<dayTranslate.size;i++) {
                            message(dayTranslate[i]);
                        }
                        break;
                    default:
                        break;
                }
            }
        }
    }
}
