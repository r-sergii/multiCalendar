namespace Multicalendar {

    class WikiProvider {
        //const
        string baseUrl;// = "https://multiapps-seven.vercel.app/api/calendarwiki/lang/";

        Http.Client http;

        public WikiProvider() {
            http = new Http.Client();
            var app = GLib.Application.get_default();
            baseUrl = (app as Multicalendar.Application).baseUrl;
        }

        public void getItems ( Gee.ArrayList<WikiModel> listWiki, string locale ) {
            var host = baseUrl + locale;

            try {
                var response = http.get( host );
                if ( response.status.code == 200 ){
                    //stdout.printf(@"My public IP address is: $(response)\n");
                    message (response.to_string ());

                    var parser = new Json.Parser ();
                    parser.load_from_data ((string)response.to_string (), -1);
                    unowned Json.Node node = parser.get_root();
                    unowned Json.Array arr = node.get_array();
                    int i = 0;
                    foreach(unowned Json.Node item in arr.get_elements ()) {
                        listWiki.add (new WikiModel.fromJson (item) );

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
