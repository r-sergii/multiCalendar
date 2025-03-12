namespace Multicalendar {

    public class HorizView : Gtk.Box {

        public Gee.ArrayList<DateWidget> listWidgets;

        public HorizView () {
            Object (orientation: Gtk.Orientation.HORIZONTAL, spacing: 5);
        }

        construct{
            listWidgets = new Gee.ArrayList<DateWidget> ();

//            var app = GLib.Application.get_default();
  //          var clockService = (app as Multiclock.Application).clockService;

            for(int i = 0; i < 10; i++) {

                var label = new DateWidget(i.to_string ());

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
