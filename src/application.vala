namespace Multicalendar {
    public class Application : Adw.Application {

        public string baseUrl = "http://192.168.0.106:8070/api/calendar/";
//        public string vercelUrl = "http://192.168.0.105:8020/api/calendarwiki/lang/";
        public string vercelUrl = "https://multiapps-seven.vercel.app/api/calendarwiki/lang/";

        public Adw.ColorScheme theme { get; set; }
        private Multicalendar.CalendarService _calendarService;
        private Multicalendar.MonthsService _monthsService;
        private Multicalendar.DaysService _daysService;
        private Multicalendar.InfoService _infoService;
        private Multicalendar.WikiService _wikiService;

        private Multicalendar.VertView _vertView;
        private Multicalendar.HorizView _horizView;

        private Multicalendar.SettingsService _settingsService;
        private GLib.DateTime _dateTime;

        public Application () {
            Object (application_id: "io.github.r_sergii.multiCalendar", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "info", this.on_info_action },
                { "datechange", this.on_datechange_action },
                { "language", this.on_language_action },
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.on_quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.info", {"<primary>i"});
            this.set_accels_for_action ("app.datechange", {"<primary>d"});
            this.set_accels_for_action ("app.language", {"<primary>l"});
            this.set_accels_for_action ("app.about", {"<primary>a"});
            this.set_accels_for_action ("app.quit", {"<primary>q"});

            var set_theme_action = new GLib.PropertyAction ("set_app_theme", this, "theme");
            set_theme_action.notify.connect (this.set_app_theme);
            this.add_action (set_theme_action);

            _dateTime = new GLib.DateTime.now ();
            _settingsService = new SettingsService ();
            _calendarService = new CalendarService ();
            _monthsService = new MonthsService ();
            _daysService = new DaysService ();
            _infoService = new InfoService ();
            _wikiService = new WikiService ();
        }

        public override void activate () {
            base.activate ();

            init_app_theme ();

            var app = GLib.Application.get_default();
            var locale = (app as Multicalendar.Application).settingsService.locale.locale;

            // Css settings
            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("/io/github/r_sergii/multiCalendar/theme_switcher.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            var win = this.active_window;
            if (win == null) {
                var connectService = new ConnectService ();
                bool result = connectService.connect ();
                if (result == false) {
                    var noconnect = new Multicalendar.NoConnectWindow (this);
                    noconnect.present ();
                    return;
                }

                var splash = new Multicalendar.SplashWindow (this);
                splash.present ();
                _calendarService.getItems (_dateTime);
                _monthsService.getItems ();
                _daysService.getItems ();
                _infoService.getItems ();
                message(locale);
                _wikiService.getItems (locale);//"en");
                Timeout.add (3000, make_window);

//                win = this.create_window ();
  //              win.present ();
                this.set_app_theme ();
//                win = new Multicalendar.Window (this);
            }
            win.present ();
        }

        public GLib.DateTime dateTime {
            get {
                return _dateTime;
            }
            set {
                _dateTime = value;
            }
        }

        public Multicalendar.CalendarService calendarService {
            get {
                return _calendarService;
            }
        }

        public Multicalendar.MonthsService monthsService {
            get {
                return _monthsService;
            }
        }

        public Multicalendar.DaysService daysService {
            get {
                return _daysService;
            }
        }

        public Multicalendar.InfoService infoService {
            get {
                return _infoService;
            }
        }

        public Multicalendar.WikiService wikiService {
            get {
                return _wikiService;
            }
        }

        public Multicalendar.VertView vertView {
            get {
                return _vertView;
            }
            set {
                _vertView = value;
            }
        }

        public Multicalendar.HorizView horizView {
            get {
                return _horizView;
            }
            set {
                _horizView = value;
            }
        }

        public Multicalendar.SettingsService settingsService {
            get {
                return _settingsService;
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
//                license_type = License.Apache-2.0,
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

        private void init_app_theme () {
            var th = settingsService.theme;
            switch (th.theme) {
                case 0: theme = Adw.ColorScheme.DEFAULT;
                        break;
                case 1: theme = Adw.ColorScheme.FORCE_LIGHT;
                        break;
                case 2: theme = Adw.ColorScheme.FORCE_DARK;
                        break;
                case 3: theme = Adw.ColorScheme.PREFER_LIGHT;
                        break;
                case 4: theme = Adw.ColorScheme.PREFER_DARK;
                        break;
                default: theme = Adw.ColorScheme.DEFAULT;
                        break;
            }
            Adw.StyleManager.get_default ().set_color_scheme (this.theme);
        }

        private void set_app_theme () {
            Adw.StyleManager.get_default ().set_color_scheme (this.theme);
//            message (this.theme.to_string());

            var th = settingsService.theme;

            switch(theme) {
                case Adw.ColorScheme.FORCE_LIGHT:
//                    message ("FL");
                    th.theme = 1;
                    break;
                case Adw.ColorScheme.FORCE_DARK:
//                    message ("FD");
                    th.theme = 2;
                    break;
                case Adw.ColorScheme.PREFER_LIGHT:
//                    message ("PFL");
                    th.theme = 3;
                    break;
                case Adw.ColorScheme.PREFER_DARK:
//                    message ("PFL");
                    th.theme = 4;
                    break;
                case Adw.ColorScheme.DEFAULT:
//                    message ("DEF");
                    th.theme = 0;
                    break;
                default:
//                    message ("default");
                    th.theme = 0;
                    break;
            }
//            th.toSettings ();
            settingsService.writeTheme ();

        }

        private void on_language_action () {
//            message ("language action show activated");

            var language = new Multicalendar.LanguageWindow (this.active_window as Multicalendar.MainWindow);
            language.set_transient_for (this.active_window);
            language.show ();

//            (this.active_window as Multiclock.MainWindow).init_menu ();
        }

        private void on_datechange_action () {
            message ("date change action show activated");

//            var language = new Multicalendar.LanguageWindow (this.active_window as Multicalendar.MainWindow);
  //          language.set_transient_for (this.active_window);
    //        language.show ();

            (this.active_window as Multicalendar.MainWindow).applyDateChange ();
        }

        private void on_info_action () {
            message ("info action show activated");

//            var language = new Multicalendar.LanguageWindow (this.active_window as Multicalendar.MainWindow);
  //          language.set_transient_for (this.active_window);
    //        language.show ();

            (this.active_window as Multicalendar.MainWindow).applyInfo ();
        }

        public void on_apply_view () {
            (this.active_window as Multicalendar.MainWindow).applyView ();
        }

        public void on_apply_wait () {
            (this.active_window as Multicalendar.MainWindow).applyWait ();
            _calendarService.clear ();
            _calendarService.getItems (_dateTime);

//            reset.begin();
            Timeout.add (2000, reset);
        }

        private bool reset()
        {
            this.vertView.reset();
            this.horizView.reset();
            on_apply_view();
            return false;
        }

        private void on_quit () {
//            this.get_windows ().foreach ((obj) => {
  //              var win = (Multicalendar.MainWindow) obj;
    //            win.close_all ();
      //      });
            Multicalendar.MainWindow win = this.active_window as Multicalendar.MainWindow;
            win.on_close_application ();
        }
    }
}

