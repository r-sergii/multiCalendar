namespace Multicalendar {

    public class DateChangeView : Gtk.Box {

        private Adw.ToastOverlay overlay;
        private Adw.Clamp clamp;
        private Gtk.Label labelDate;
//        private Gtk.SpinButton spinCentry;
  //      private Gtk.SpinButton spinYear;
        private Gtk.SpinButton spinDay;
        private Gtk.ComboBoxText comboMonth;
        private Gtk.Button confirm;
        private Gtk.Button cancel;
//        private int centry;
        private int year;
        private int month;
        private int day;

        private Gtk.SpinButton spin4;
        private Gtk.SpinButton spin3;
        private Gtk.SpinButton spin2;
        private Gtk.SpinButton spin1;

        public DateChangeView () {
            Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
        }

        private void applyDate () {
//            labelDate.set_text (date.get_year().to_string() + "/"
  //              + date.get_month().to_string() + "/"
    //            + date.get_day_of_month().to_string());
            labelDate.set_text (//centry.to_string() +
                year.to_string() + "/"
                + month.to_string() + "/"
                + day.to_string());
        }

        private void on_change_day () {
//            centry = (int)spinCentry.value;
            year = (int)(spin4.value * 1000 + spin3.value * 100 + spin2.value * 10 + spin1.value);
            month = comboMonth.get_active() + 1;
            switch(month) {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                        spinDay.set_range(1,31);
                        break;
                case 4:
                case 6:
                case 9:
                case 11:
                        spinDay.set_range(1,30);
                        break;
                case 2:
                        spinDay.set_range(1,28);
                        break;
                default:
                        spinDay.set_range(1,28);
                        break;
            }
            day = (int)spinDay.value;
            applyDate();
        }

        private void on_confirm () {
            var app = GLib.Application.get_default();
            GLib.DateTime dateTime = new GLib.DateTime (new GLib.TimeZone.local(),
                    //centry * 100 +
                    year, month, day,
                    0, 0, 0.0);
            (app as Multicalendar.Application).dateTime = dateTime;

            (app as Multicalendar.Application).on_apply_wait ();
        }

        private void on_cancel () {
            var app = GLib.Application.get_default();
            //(app.active_window as Multicalendar.MainWindow)
            (app as Multicalendar.Application).on_apply_view ();
        }


        construct{
            var app = GLib.Application.get_default();
            var months = (app as Multicalendar.Application).monthsService;
            var date = (app as Multicalendar.Application).dateTime;

//            centry = (int)Math.round(date.get_year() / 100);
  //          year = date.get_year() - (int)Math.round(date.get_year() / 100) * 100 ;
            day = date.get_day_of_month();
            month = (int)(date.get_month() - 1);

            confirm = new Gtk.Button();
            var aconfirm = new Adw.ButtonContent();
            aconfirm.set_icon_name ("ok128");
            aconfirm.set_label ("OK");
            confirm.set_child (aconfirm);
            confirm.clicked.connect (on_confirm);

            cancel = new Gtk.Button();
            var acancel = new Adw.ButtonContent();
            acancel.set_icon_name ("cancel128");
            acancel.set_label ("Cancel");
            cancel.set_child (acancel);
            cancel.clicked.connect (on_cancel);

            labelDate = new Gtk.Label (date.get_year().to_string() + "/"
                + date.get_month().to_string() + "/"
                + date.get_day_of_month().to_string());
//            var labelCentry = new Gtk.Label ("Cenrty :");
            var labelYear = new Gtk.Label ("Year :");
            var labelMonth = new Gtk.Label ("Month :");
            var labelDay = new Gtk.Label ("Day :");
//            spinCentry = new Gtk.SpinButton.with_range(0,99,1);
//            spinYear = new Gtk.SpinButton.with_range(0,99,1);
            spinDay = new Gtk.SpinButton.with_range(1,31,1);

//            spinCentry.value = (int)Math.round(date.get_year() / 100);
//            spinYear.value = date.get_year() - Math.round(date.get_year() / 100) * 100 ;
            spinDay.value = date.get_day_of_month();

            spin4 = new Gtk.SpinButton.with_range(0,9,1);
            spin3 = new Gtk.SpinButton.with_range(0,9,1);
            spin2 = new Gtk.SpinButton.with_range(0,9,1);
            spin1 = new Gtk.SpinButton.with_range(0,9,1);
            spin4.set_orientation (Gtk.Orientation.VERTICAL);
            spin3.set_orientation (Gtk.Orientation.VERTICAL);
            spin2.set_orientation (Gtk.Orientation.VERTICAL);
            spin1.set_orientation (Gtk.Orientation.VERTICAL);

            string sYear = date.get_year().to_string();
            message(sYear);
            message(sYear.length.to_string());
            message(sYear.substring(2,1));
            if(sYear.length > 3) {
                spin4.value = int.parse(sYear.substring(0,1));
                spin3.value = int.parse(sYear.substring(1,1));
                spin2.value = int.parse(sYear.substring(2,1));
                spin1.value = int.parse(sYear.substring(3,1));
            }
            else if(sYear.length > 3) {
                spin4.value = 0;
                spin3.value = int.parse(sYear.substring(0,1));
                spin2.value = int.parse(sYear.substring(1,1));
                spin1.value = int.parse(sYear.substring(2,1));
            }
            else if(sYear.length > 2) {
                spin4.value = 0;
                spin3.value = 0;
                spin2.value = int.parse(sYear.substring(0,1));
                spin1.value = int.parse(sYear.substring(1,1));
            }
            else if(sYear.length > 1) {
                spin4.value = 0;
                spin3.value = 0;
                spin2.value = 0;
                spin1.value = int.parse(sYear.substring(0,1));
            }
            else {
                spin4.value = 0;
                spin3.value = 0;
                spin2.value = 0;
                spin1.value = 1;
            }

//            spinCentry.adjustment.value_changed.connect(on_change_day);
//            spinYear.adjustment.value_changed.connect(on_change_day);
            spin4.adjustment.value_changed.connect(on_change_day);
            spin3.adjustment.value_changed.connect(on_change_day);
            spin2.adjustment.value_changed.connect(on_change_day);
            spin1.adjustment.value_changed.connect(on_change_day);
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

            var yField = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            yField.set_halign(Gtk.Align.CENTER);
            yField.set_valign(Gtk.Align.CENTER);
            yField.spacing = 10;
            yField.append (labelYear);
            yField.append (spin4);
            yField.append (spin3);
            yField.append (spin2);
            yField.append (spin1);
/*
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
*/
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

            var buttonField = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            buttonField.set_halign(Gtk.Align.CENTER);
            buttonField.set_valign(Gtk.Align.CENTER);
            buttonField.spacing = 100;
            buttonField.append (confirm);
            buttonField.append (cancel);

            var listBox = new Gtk.ListBox ();
            listBox.append (dateField);
            listBox.append (yField);
//            listBox.append (centryField);
  //          listBox.append (yearField);
            listBox.append (monthField);
            listBox.append (dayField);
            listBox.append (buttonField);

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
