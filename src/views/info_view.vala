namespace Multicalendar {

    public class InfoView : Gtk.Box {

        private Adw.ToastOverlay overlay;
        private Adw.Clamp clamp;
        private Gtk.Label labelDate;

        public InfoView () {
            Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
        }

        construct{
            var app = GLib.Application.get_default();
            var months = (app as Multicalendar.Application).monthsService;
            var date = (app as Multicalendar.Application).dateTime;

            labelDate = new Gtk.Label (date.get_year().to_string() + "/"
                + date.get_month().to_string() + "/"
                + date.get_day_of_month().to_string());

            var listBox = new Gtk.ListBox ();
            listBox.append (labelDate);
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
