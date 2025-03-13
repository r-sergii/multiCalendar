namespace Multicalendar {

    public class VertView : Gtk.Box {

        public Gee.ArrayList<DateWidget> listWidgets;

        public VertView () {
            Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
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
