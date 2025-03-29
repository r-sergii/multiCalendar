namespace Multicalendar {

    public class WikiService {
        public Gee.ArrayList<WikiModel> listWiki;

        public WikiService() {
            listWiki = new Gee.ArrayList<WikiModel> ();
        }

        public void getItems (string locale) {
            var wikiProvider = new WikiProvider ();
            wikiProvider.getItems ( listWiki, locale );
        }
    }
}
