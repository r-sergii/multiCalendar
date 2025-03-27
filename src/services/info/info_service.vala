namespace Multicalendar {

    public class InfoService {
        public Gee.ArrayList<InfoModel> listInfo;

        public InfoService() {
            listInfo = new Gee.ArrayList<InfoModel> ();
        }

        public void getItems () {
            var infoProvider = new InfoProvider ();
            infoProvider.getItems ( listInfo );
//            message (listCalendars.size.to_string ());
        }
    }
}
