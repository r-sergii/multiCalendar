namespace Multicalendar {
    public class Application : Adw.Application {

        public Adw.ColorScheme theme { get; set; }
        private Multicalendar.CalendarService _calendarService;

        public Application () {
            Object (application_id: "io.github.r_sergii.multiCalendar", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", {"<primary>q"});

            var set_theme_action = new GLib.PropertyAction ("set_app_theme", this, "theme");
            set_theme_action.notify.connect (this.set_app_theme);
            this.add_action (set_theme_action);

            _calendarService = new CalendarService ();
        }

        public override void activate () {
            base.activate ();

            // Css settings
            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("/io/github/r_sergii/multiCalendar/theme_switcher.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            var win = this.active_window;
            if (win == null) {
                var splash = new Multicalendar.SplashWindow (this);
                splash.present ();
                _calendarService.getItems ();
                Timeout.add (3000, make_window);

//                win = this.create_window ();
  //              win.present ();
                this.set_app_theme ();
//                win = new Multicalendar.Window (this);
            }
            win.present ();
        }

         public Multicalendar.CalendarService calendarService {
            get {
                return _calendarService;
            }
        }

        private bool make_window()
        {
            var win = new Multicalendar.MainWindow (this);
//            win.set_position ( Gtk.WindowPosition.CENTER );// (GTK_WIN_POS_CENTER);
            win.present ();
            return false;
        }


        private Multicalendar.MainWindow create_window () {
            var win = new Multicalendar.MainWindow (this);

            // Css settings
//            var provider = new Gtk.CssProvider ();
//            provider.load_from_resource ("/io/github/r_sergii/multiCalendar/theme_switcher.css");
//            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            return win;
        }

        private void on_about_action () {
//            string[] authors = { "r-sergii" };
  //          Gtk.show_about_dialog (this.active_window,
    //                               "program-name", "multicalendar",
      //                             "authors", authors,
        //                           "version", "0.1.0");

            var win = new Adw.AboutWindow () {
                application_name = "multiCalendar",
                application_icon = "io.github.r_sergii.multiCalendar",
                version = "0.1.0",
                copyright = "Copyright © 2025 Serhii Rudchenko",
//                license_type = License.GPL_3_0,
                developer_name = "Serhii Rudchenko",
                developers = {"Serhii Rudchenko email:sergej.rudchenko@gmail.com"},
                translator_credits = _("translator-credits"),
                website = "https://r-serega.github.io/mapps/",
                issue_url = "email:multiApps@i.ua"
            };
            win.set_transient_for (this.active_window);
            win.show ();
        }

        private void on_preferences_action () {
            message ("app.preferences action activated");
        }

        private void set_app_theme () {
            Adw.StyleManager.get_default ().set_color_scheme (this.theme);
        }
    }
}
