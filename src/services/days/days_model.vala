namespace Multicalendar {

    public abstract class DaysField {
        public const string day = "day";
    }

    public class DaysModel {
        public string day;

        public DaysModel(string _day)
        {
            day = _day;
        }

        public DaysModel.fromJson (Json.Node item) {
            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case DaysField.day:
                        unowned Json.Node it = obj.get_member (name);
                        day = obj.get_string_member (DaysField.day);
//                        message (day);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}

