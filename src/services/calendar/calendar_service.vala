namespace Multicalendar {

    public class CalendarService {
        public Gee.ArrayList<CalendarModel> listCalendars;

        public CalendarService() {
            listCalendars = new Gee.ArrayList<CalendarModel> ();
        }

        public void getItems () {
            var calendarProvider = new CalendarProvider ();
            calendarProvider.getItems ( listCalendars );
            message (listCalendars.size.to_string ());
        }
    }
}


