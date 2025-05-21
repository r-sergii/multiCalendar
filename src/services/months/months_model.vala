namespace Multicalendar {

    public abstract class MonthsField {
        public const string month = "month";
    }

    public class MonthsModel {
        public string month;

        public MonthsModel(string _month)
        {
            month = _month;
        }

        public MonthsModel.fromJson (Json.Node item) {
            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case MonthsField.month:
                        unowned Json.Node it = obj.get_member (name);
                        month = obj.get_string_member (MonthsField.month);
//                        message (month);
                        break;
                    default:
                        break;
                }
            }
        }
    }
}

