namespace Multicalendar {

    public class HorizView : Gtk.Box {

        public Gee.ArrayList<DateWidget> listWidgets;

        public HorizView () {
            Object (orientation: Gtk.Orientation.HORIZONTAL, spacing: 5);
        }

        construct{
            listWidgets = new Gee.ArrayList<DateWidget> ();

            var app = GLib.Application.get_default();
            var calendarService = (app as Multicalendar.Application).calendarService;
            var locale = (app as Multicalendar.Application).settingsService.locale;

            for(int i = 0; i < calendarService.listCalendars.size; i++) {
                var label = new DateWidget(calendarService.listCalendars[i], locale);

                this.append (label);
                listWidgets.add (label);
            }
        }

        public void reset () {
            foreach(var item in listWidgets) {
                this.remove (item);
            }
            listWidgets.clear ();

            var app = GLib.Application.get_default();
            var calendarService = (app as Multicalendar.Application).calendarService;
            var locale = (app as Multicalendar.Application).settingsService.locale;

            for(int i = 0; i < calendarService.listCalendars.size; i++) {
                var label = new DateWidget(calendarService.listCalendars[i], locale);

                this.append (label);
                listWidgets.add (label);
            }

/*
            var app = GLib.Application.get_default();
            var clockService = (app as Multiclock.Application).clockService;

            //this.foreach((e) => { ;});
            for(int i=0; i < listWidgets.size; i++) {
                listWidgets[i].visible = clockService.listVisible[i];
            }
            */
        }
    }
}
