namespace Multicalendar {

    public class InfoView : Gtk.Box {

        private Adw.ToastOverlay overlay;
        private Adw.Clamp clamp;
        private Gtk.Label labelDate;
        private Gtk.Expander expanderGregorian;

        public InfoView () {
            Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
        }

        construct{
            var app = GLib.Application.get_default();
            var months = (app as Multicalendar.Application).monthsService;
            var days = (app as Multicalendar.Application).daysService;
            var info = (app as Multicalendar.Application).infoService;
            var date = (app as Multicalendar.Application).dateTime;

            labelDate = new Gtk.Label (date.get_year().to_string() + "/"
                + date.get_month().to_string() + "/"
                + date.get_day_of_month().to_string());
/*
            expanderGregorian = new Gtk.Expander ("Gregorian & Julian Calendar");
//            expanderGregorian = new Gtk.Expander ("<b> Gregorian & Julian Calendar </b>");
            expanderGregorian.set_use_markup(true);
            var listGregorian = new Gtk.ListBox ();

            listGregorian.append (new Gtk.Label("Days of the week"));
            listGregorian.append (new Gtk.Label(""));
            for(int i=0;i<days.listDays.size;i++) {
                listGregorian.append (new Gtk.Label(days.listDays[i].day));
            }
            listGregorian.append (new Gtk.Label(""));
            listGregorian.append (new Gtk.Label("Months of the year"));
            listGregorian.append (new Gtk.Label(""));
            for(int i=0;i<months.listMonths.size;i++) {
                listGregorian.append (new Gtk.Label(months.listMonths[i].month));
            }

            expanderGregorian.set_child (listGregorian);
*/
            var listBox = new Gtk.ListBox ();

            for(int i=0;i<info.listInfo.size;i++) {
                var expander = expanderGregorian = new Gtk.Expander (info.listInfo[i].calendar);
                expander.set_use_markup(true);
                var list = new Gtk.ListBox ();

                list.append (new Gtk.Label("Days of the week"));
                list.append (new Gtk.Label(""));
                for(int j=0;j<info.listInfo[i].day.size;j++) {
                    list.append (new Gtk.Label(info.listInfo[i].day[j]));// + " : "
                        //+ info.listInfo[i].dayTranslate[j]));
                }
                list.append (new Gtk.Label(""));
                list.append (new Gtk.Label("Months of the year"));
                list.append (new Gtk.Label(""));
                for(int l=0;l<info.listInfo[i].month.size;l++) {
                    list.append (new Gtk.Label(info.listInfo[i].month[l]));
                }

                expander.set_child (list);
                listBox.append (expander);
            }


            //listBox.append (expanderGregorian);
//            listBox.append (centryField);
  //          listBox.append (yearField);
    //        listBox.append (monthField);
      //      listBox.append (dayField);

            clamp = new Adw.Clamp ();
            clamp.tightening_threshold = 100;
            //clamp.valign = center</property>
            clamp.set_valign(Gtk.Align.CENTER);
            clamp.margin_top = 36;
            clamp.margin_bottom = 36;
            clamp.set_child (listBox);

            var scroll = new Gtk.ScrolledWindow () {
                propagate_natural_height = true,
                propagate_natural_width = true
            };
            scroll.set_child(clamp);

            overlay = new Adw.ToastOverlay();
            overlay.set_child(scroll);

            this.append (overlay);
        }
    }
}
