namespace Multicalendar {

    public class Calendar0Service {
        public Gee.ArrayList<Calendar0Model> listCalendars;

        public Calendar0Service() {
            listCalendars = new Gee.ArrayList<Calendar0Model> ();
        }

        public void getItems () {
            var calendar0Provider = new Calendar0Provider ();
            calendar0Provider.getItems ( listCalendars );
            message (listCalendars.size.to_string ());
        }
    }
}


