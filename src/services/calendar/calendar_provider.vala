namespace Multicalendar {

    class CalendarProvider {
        const string baseUrl = "http://192.168.0.103:8070/api/calendar/";

        Http.Client http;

        public CalendarProvider() {
            http = new Http.Client();
        }

        public void getItems ( Gee.ArrayList<CalendarModel> listCalendars, GLib.DateTime _value ) {
            var host = baseUrl
            + "all/year/" + _value.get_year().to_string()
            + "/month/" + _value.get_month().to_string()
            + "/day/" + _value.get_day_of_month().to_string();

            try {
                var response = http.get( host );
                if ( response.status.code == 200 ){
                    //stdout.printf(@"My public IP address is: $(response)\n");
//                    message (response.to_string ());

                    var parser = new Json.Parser ();
                    parser.load_from_data ((string)response.to_string (), -1);
                    unowned Json.Node node = parser.get_root();
                    unowned Json.Array arr = node.get_array();
                    int i = 0;
                    foreach(unowned Json.Node item in arr.get_elements ()) {
                        listCalendars.add (new CalendarModel.fromJson (item) );

                        i++;
                        message(i.to_string());
                    }
                }
            } catch (Error err){
                stderr.printf(@"$(err.message)\n");
            }
        }
    }
}
