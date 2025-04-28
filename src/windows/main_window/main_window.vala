namespace Multicalendar {
    [GtkTemplate (ui = "/io/github/r_sergii/multiCalendar/windows/main_window/main_window.ui")]
    public class MainWindow : Gtk.ApplicationWindow {
//        [GtkChild]
//        private unowned Gtk.Label label;
        private Gtk.CssProvider css_provider;

        [GtkChild]
        private unowned Gtk.Box mainBox;//list;
        private MyLib.ThemeSwitcher theme_switcher;
        [GtkChild]
        private unowned Gtk.MenuButton menu_button;
        [GtkChild]
        private unowned Gtk.Button back_button;
        [GtkChild]
        private unowned Gtk.Button question_button;
//        [GtkChild]
  //      private unowned Adw.MenuButton open_button;

//        private Multicalendar.CalendarModel _model;
        private int64 _id_model;
        private Multicalendar.VertView vertView;
        private Multicalendar.HorizView horizView;
        private Multicalendar.CalendarView calendarView;
        private Multicalendar.Calendar6View calendar6View;
        private Multicalendar.Calendar10View calendar10View;
        private Multicalendar.DateChangeView dateChangeView;
        private Multicalendar.InfoView infoView;
//        private Multicalendar.WaitView waitView;
        private Multicalendar.AwaitView waitView;
        private bool isVert;
        private Gtk.ScrolledWindow scroll;

        public MainWindow (Gtk.Application app) {
            Object (application: app);
            this.bind_property("default-width", this, "windowWidth", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
            this.bind_property("default-height", this, "windowHeight", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
            this.bind_property("maximized", this, "isMaximized", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
        }

        public void init_menu () {
            var app = GLib.Application.get_default();
            var locale = (app as Multicalendar.Application).settingsService.locale;

            var menu = new GLib.Menu();
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            var item_theme = new GLib.MenuItem (_("custom"), null);//"app.set_app_theme");
            item_theme.set_attribute ("custom", "s", "theme");
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//            var item_preferences = new GLib.MenuItem (_("Preferences"), "app.preferences");
            var item_info = new GLib.MenuItem (_(locale.info), "app.info");
            var item_datechange = new GLib.MenuItem (_(locale.date_change), "app.datechange");
            var item_language = new GLib.MenuItem (_(locale.language), "app.language");

            var item_about = new GLib.MenuItem (_(locale.about +" multiCalendar"), "app.about");
            var item_quit = new GLib.MenuItem (_(locale.exit_), "app.quit");

//            message (locale.locale);

            menu.append_item (item_theme);
//            menu.append_item (item_preferences);
            menu.append_item (item_datechange);
            menu.append_item (item_info);
            menu.append_item (item_language);

            menu.append_item (item_about);
            menu.append_item (item_quit);

            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
            pop.set_menu_model (menu);

            this.theme_switcher = new MyLib.ThemeSwitcher ();
            pop.add_child (this.theme_switcher, "theme");
        }

        construct{
//            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
  //          this.theme_switcher = new MyLib.ThemeSwitcher ();
    //        pop.add_child (this.theme_switcher, "theme");

            init_menu ();

            back_button.clicked.connect (on_apply_view);
            question_button.clicked.connect (on_call_wiki);

            css_provider = new Gtk.CssProvider();
            css_provider.load_from_resource("/io/github/r_sergii/multiCalendar/date_widget.css");
            Gtk.StyleContext.add_provider_for_display(Gdk.Display.get_default(),css_provider,Gtk.STYLE_PROVIDER_PRIORITY_USER);

            //Gtk.ScrolledWindow
            scroll = new Gtk.ScrolledWindow ();//null, null);
            scroll.set_policy (Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
            scroll.set_vexpand(true);
            scroll.set_hexpand(true);

            vertView = new VertView ();
            horizView = new HorizView ();
            calendarView = new CalendarView ();
            calendar6View = new Calendar6View ();
            calendar10View = new Calendar10View ();
            dateChangeView = new DateChangeView ();
            infoView = new InfoView ();
//            waitView = new WaitView ();
            waitView = new AwaitView ();
            var app = GLib.Application.get_default();

            (app as Multicalendar.Application).vertView = vertView;
            (app as Multicalendar.Application).horizView = horizView;

//            applyView ();
            applyWait ();
            mainBox.append (scroll);
        }

        public void applyCalendar (Multicalendar.CalendarModel _model) {
            calendarView.model = _model;
            var app = GLib.Application.get_default();
            var locale = (app as Multicalendar.Application).settingsService.locale;
            this.set_title (calendarView.calendarModel.calendar + " " + locale.calendar);
            scroll.set_child (calendarView);
            menu_button.visible = false;
            back_button.visible = true;
            question_button.visible = true;
        }

        public void applyCalendar6 (Multicalendar.CalendarModel _model) {
            calendar6View.model = _model;
            var app = GLib.Application.get_default();
            var locale = (app as Multicalendar.Application).settingsService.locale;
            this.set_title (calendar6View.calendarModel.calendar + " " + locale.calendar);
            scroll.set_child (calendar6View);
            menu_button.visible = false;
            back_button.visible = true;
            question_button.visible = true;
        }

        public void applyCalendar10 (Multicalendar.CalendarModel _model) {
            calendar10View.model = _model;
            var app = GLib.Application.get_default();
            var locale = (app as Multicalendar.Application).settingsService.locale;
            this.set_title (calendar10View.calendarModel.calendar + " " + locale.calendar);
            scroll.set_child (calendar10View);
            menu_button.visible = false;
            back_button.visible = true;
            question_button.visible = true;
        }

        public void applyDateChange () {
//            var app = GLib.Application.get_default();
  //          var locale = (app as Multicalendar.Application).settingsService.locale;
    //        this.set_title (calendarView.calendarModel.calendar + " " + locale.calendar);
            scroll.set_child (dateChangeView);
            menu_button.visible = false;
            back_button.visible = true;
            question_button.visible = false;//true;
        }

        public void applyInfo () {
            scroll.set_child (infoView);
            menu_button.visible = false;
            back_button.visible = true;
            question_button.visible = false;//true;
        }

        public void applyWait () {
            scroll.set_child (waitView);
            menu_button.visible = false;
            back_button.visible = true;
            question_button.visible = true;
        }

        private void on_apply_view () {
            applyView ();
        }

        private void on_call_wiki () {
            var app = GLib.Application.get_default();
            var wiki = (app as Multicalendar.Application).wikiService;
//            var model = this.model;
  //          message(model.id.to_string());
            var wikiModel = wiki.getByIndex (_id_model);//model.id);
            message(wikiModel.wiki);

            var browser = new BrowserWindow(
            wikiModel.wiki, wikiModel.nname);
//            wiki.listWiki[0].wiki, wiki.listWiki[0].nname);

//            elementService.listElements[nomer - 1].wiki,
  //              elementService.listElements[nomer - 1].symbol + " : "
    //            + elementService.listElements[nomer - 1].latin_name);
            browser.show();

            var progress = new Multicalendar.ProgressWidget (app as Multicalendar.Application);
            progress.present ();
        }

        public int64 id_model {
            set {
                _id_model = value;
            }
            get {
                return _id_model;
            }
        }
/*
        public Multicalendar.CalendarModel model {
            set {
//                calendarView.calendarModel = value;
                _model = value;
            }
            get {
//                if(calendarView.calendarModel != null) {
//                    return calendarView.calendarModel;
                    return _model;
  //              }
    //            else {
      //              return new Multicalendar.CalendarModel("", "", "", "", "", "", "", "", "", "", "", "", "", "");
        //        }
            }
        }
*/
        //private
        public void applyView () {
            back_button.visible = false;
            question_button.visible = false;
            menu_button.visible = true;
            this.set_title ("multiCalendar");
            if (windowHeight >= windowWidth) {
                scroll.set_child (vertView);
//                scroll.set_child (waitView);
  //
    //            back_button.visible = true;
                isVert = true;
            }
            else {
                scroll.set_child (horizView);
                isVert = false;
            }

        }

/////// Size determination
        public int windowHeight {
            get { return get_height(); }
            set {
                Idle.add(() => {
//                    print(@"window height: $value\n");
                    return Source.REMOVE;
                });
                if ((windowHeight >= windowWidth) && (isVert != true)) {
                    applyView ();
                }
                if ((windowHeight < windowWidth) && (isVert == true)) {
                    applyView ();
                }
            }
        }

        public int windowWidth {
            get { return get_width(); }
            set {
                Idle.add(() => {
//                    print(@"window width: $value\n");
                    return Source.REMOVE;
                });
                //grid.set_size_request (get_width (), get_height ());
                if ((windowHeight >= windowWidth) && (isVert != true)) {
                    applyView ();
                }
                if ((windowHeight < windowWidth) && (isVert == true)) {
                    applyView ();
                }
            }
        }

        public bool isMaximized {
            get { return maximized; }
            set {
                Idle.add(() => {
//                    print(@"window maximized: $isMaximized; width: $(get_width())\n");
                    return Source.REMOVE;
                });
                if ((windowHeight >= windowWidth) && (isVert != true)) {
                    applyView ();
                }
                if ((windowHeight < windowWidth) && (isVert == true)) {
                    applyView ();
                }
            }
        }
/////???

        private void on_language_action () {
//            message ("language action show activated");

            var language = new Multicalendar.LanguageWindow (this);
            language.set_transient_for (this);
            language.show ();

            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
            pop.hide ();
        }

        public void on_close_application () {
            var app = GLib.Application.get_default();
            call_are_exit_dialog (app);
            //app.quit();
            //return true;
        }


        private void call_save_changes_dialog () {
            var save_changes_dialog = new Adw.MessageDialog(this, _("Changes are not saved"), _("Save changes to the current note before exiting the program?"));
            save_changes_dialog.add_response("cancel", _("_Cancel"));
            save_changes_dialog.add_response("ok", _("_OK"));
            save_changes_dialog.set_default_response("ok");
            save_changes_dialog.set_close_response("cancel");
            save_changes_dialog.set_response_appearance("ok", SUGGESTED);
            save_changes_dialog.show();
            save_changes_dialog.response.connect((response) => {
                if (response == "ok") {
                    try {
                         //FileUtils.set_contents (file.get_path(), edit_text);
                         //app.quit();
                    } catch (Error e) {
                         stderr.printf ("Error: %s\n", e.message);
                    }
                }
                save_changes_dialog.close();
                //app.quit();
            });
        }

        private void call_are_exit_dialog (GLib.Application app) {
//            var app = GLib.Application.get_default();
//            var theme = (app as Multicalendar.Application).theme;
            var locale = (app as Multicalendar.Application).settingsService.locale;

//            var are_exit_dialog = new Adw.MessageDialog(this, _("Exit?"), _("Are you sure you want to exit?"));
  //          are_exit_dialog.add_response("cancel", _("_Cancel"));
    //        are_exit_dialog.add_response("ok", _("_Exit"));
            var are_exit_dialog = new Adw.MessageDialog(this, _(locale.exit_), _(locale.are_exit));
            are_exit_dialog.add_response("cancel", _(locale.cancel));
            are_exit_dialog.add_response("ok", _(locale.exit_));
            are_exit_dialog.set_default_response("ok");
            are_exit_dialog.set_close_response("cancel");
            are_exit_dialog.set_response_appearance("ok", SUGGESTED);
            are_exit_dialog.show();
            are_exit_dialog.response.connect((response) => {
                if (response == "ok") {
                    try {
                         app.quit();
                    } catch (Error e) {
                         stderr.printf ("Error: %s\n", e.message);
                    }
                }
                are_exit_dialog.close();
                //app.quit();
            });
        }

    }
}

