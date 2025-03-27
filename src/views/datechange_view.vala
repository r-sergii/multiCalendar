namespace Multicalendar {

    public class DateChangeView : Gtk.Box {

        private Adw.ToastOverlay overlay;
        private Adw.Clamp clamp;
        private Gtk.Label labelDate;
        private Gtk.SpinButton spinCentry;
        private Gtk.SpinButton spinYear;
        private Gtk.SpinButton spinDay;
        private Gtk.ComboBoxText comboMonth;
        private int centry;
        private int year;
        private int month;
        private int day;

        public DateChangeView () {
            Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
        }

        private void applyDate () {
//            labelDate.set_text (date.get_year().to_string() + "/"
  //              + date.get_month().to_string() + "/"
    //            + date.get_day_of_month().to_string());
            labelDate.set_text (centry.to_string() + year.to_string() + "/"
                + month.to_string() + "/"
                + day.to_string());
        }

        private void on_change_day () {
            centry = (int)spinCentry.value;
            year = (int)spinYear.value;
            month = comboMonth.get_active() + 1;
            day = (int)spinDay.value;
            applyDate();
        }

        construct{
            var app = GLib.Application.get_default();
            var months = (app as Multicalendar.Application).monthsService;
            var date = (app as Multicalendar.Application).dateTime;

            centry = (int)Math.round(date.get_year() / 100);
            year = date.get_year() - (int)Math.round(date.get_year() / 100) * 100 ;
            day = date.get_day_of_month();
            month = (int)(date.get_month() - 1);

            labelDate = new Gtk.Label (date.get_year().to_string() + "/"
                + date.get_month().to_string() + "/"
                + date.get_day_of_month().to_string());
            var labelCentry = new Gtk.Label ("Cenrty :");
            var labelYear = new Gtk.Label ("Year :");
            var labelMonth = new Gtk.Label ("Month :");
            var labelDay = new Gtk.Label ("Day :");
            spinCentry = new Gtk.SpinButton.with_range(0,99,1);
            spinYear = new Gtk.SpinButton.with_range(0,99,1);
            spinDay = new Gtk.SpinButton.with_range(1,30,1);

            spinCentry.value = (int)Math.round(date.get_year() / 100);
            spinYear.value = date.get_year() - Math.round(date.get_year() / 100) * 100 ;
            spinDay.value = date.get_day_of_month();

            spinCentry.adjustment.value_changed.connect(on_change_day);
            spinYear.adjustment.value_changed.connect(on_change_day);
            spinDay.adjustment.value_changed.connect(on_change_day);

            comboMonth = new Gtk.ComboBoxText ();
            for(int i=0;i<months.listMonths.size;i++) {
                comboMonth.append_text(months.listMonths[i].month);
            }
            comboMonth.set_active((int)(date.get_month() - 1));

            comboMonth.changed.connect(on_change_day);

            var dateField = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            dateField.set_halign(Gtk.Align.CENTER);
            dateField.set_valign(Gtk.Align.CENTER);
            dateField.append (labelDate);

            var centryField = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            //centryField.halign = Gtk.Align.CENTER;
            centryField.set_halign(Gtk.Align.CENTER);
            centryField.set_valign(Gtk.Align.CENTER);
            centryField.spacing = 100;
            centryField.append (labelCentry);
            centryField.append (spinCentry);

            var yearField = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            yearField.set_halign(Gtk.Align.CENTER);
            yearField.set_valign(Gtk.Align.CENTER);
            yearField.spacing = 100;
            yearField.append (labelYear);
            yearField.append (spinYear);

            var monthField = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            monthField.set_halign(Gtk.Align.CENTER);
            monthField.set_valign(Gtk.Align.CENTER);
            monthField.spacing = 100;
            monthField.append (labelMonth);
            monthField.append (comboMonth);

            var dayField = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            dayField.set_halign(Gtk.Align.CENTER);
            dayField.set_valign(Gtk.Align.CENTER);
            dayField.spacing = 100;
            dayField.append (labelDay);
            dayField.append (spinDay);

            var listBox = new Gtk.ListBox ();
            listBox.append (dateField);
            listBox.append (centryField);
            listBox.append (yearField);
            listBox.append (monthField);
            listBox.append (dayField);

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
/*
            Gtk.Viewport viewport1 = new Gtk.Viewport(null, null);
            viewport1.set_size_request (150,150);
            viewport1.set_child (centry);
            viewport1.set_child (year);

            var centerBox = new Gtk.CenterBox ();
            centerBox.set_center_widget (viewport1);
            //this.set_child (centerBox);
            this.append (centerBox);
*/
 //           this.append (centry);
   //         this.append (year);
            this.append (overlay);

//            var circle = new ProgressWidgets.CircleIndicator ();
        }
    }
}
