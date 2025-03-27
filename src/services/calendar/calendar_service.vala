namespace Multicalendar {

    public class CalendarService {
        public Gee.ArrayList<CalendarModel> listCalendars;

        public CalendarService() {
            listCalendars = new Gee.ArrayList<CalendarModel> ();
        }

        public void getItems (GLib.DateTime _value) {
            var calendarProvider = new CalendarProvider ();
            calendarProvider.getItems ( listCalendars, _value );
//            message (listCalendars.size.to_string ());
        }

        public void clear () {
            listCalendars.clear ();
        }
    }
}
