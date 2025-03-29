namespace Multicalendar {

    public abstract class WikiField {
        public const string id = "id";
        public const string nomer = "nomer";
        public const string name = "name";
        public const string wikiUrl = "wiki_url";
    }

    public class WikiModel {
        public int64 id;
        public int64 nomer;
        public string nname;
        public string wiki;

        public WikiModel(int _id, int _nomer, string _name, string _wiki)
        {
            id = _id;
            nomer = _nomer;
            nname = _name;
            wiki = _wiki;
        }

        public WikiModel.fromJson (Json.Node item) {
            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case WikiField.id:
                        unowned Json.Node it = obj.get_member (name);
                        id = obj.get_int_member (WikiField.id);
                        message (id.to_string());
                        break;
                    case WikiField.nomer:
                        unowned Json.Node it = obj.get_member (name);
                        nomer = obj.get_int_member (WikiField.nomer);
                        message (nomer.to_string());
                        break;
                    case WikiField.name:
                        unowned Json.Node it = obj.get_member (name);
                        nname = obj.get_string_member (WikiField.name);
                        message (nname);
                        break;
                    case WikiField.wikiUrl:
                        unowned Json.Node it = obj.get_member (name);
                        wiki = obj.get_string_member (WikiField.wikiUrl);
                        message (wiki);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}
