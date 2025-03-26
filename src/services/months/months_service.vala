namespace Multicalendar {

    public class MonthsService {
        public Gee.ArrayList<MonthsModel> listMonths;

        public MonthsService() {
            listMonths = new Gee.ArrayList<MonthsModel> ();
        }

        public void getItems () {
            var monthsProvider = new MonthsProvider ();
            monthsProvider.getItems ( listMonths );
        }
    }
}
