namespace Multicalendar {

    public class DaysService {
        public Gee.ArrayList<DaysModel> listDays;

        public DaysService() {
            listDays = new Gee.ArrayList<DaysModel> ();
        }

        public void getItems () {
            var daysProvider = new DaysProvider ();
            daysProvider.getItems ( listDays );
        }
    }
}
