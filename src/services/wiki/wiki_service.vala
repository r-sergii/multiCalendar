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

        public WikiModel getByIndex (int64 id) {
            for(int i = 0;i<listWiki.size;i++) {
                if(id == listWiki[i].id) {
                    return listWiki[i];
                }
            }
            return new WikiModel(0,0,"","");
        }
    }
}
