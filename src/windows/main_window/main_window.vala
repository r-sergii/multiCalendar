namespace Multicalendar {
    [GtkTemplate (ui = "/io/github/r_sergii/multiCalendar/windows/main_window/main_window.ui")]
    public class MainWindow : Gtk.ApplicationWindow {
        [GtkChild]
        private unowned Gtk.Label label;

        private MyLib.ThemeSwitcher theme_switcher;
        [GtkChild]
        private unowned Gtk.MenuButton menu_button;

        public MainWindow (Gtk.Application app) {
            Object (application: app);
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
            var item_language = new GLib.MenuItem (_(locale.language), "app.language");

            var item_about = new GLib.MenuItem (_(locale.about +" multiCalendar"), "app.about");
            var item_quit = new GLib.MenuItem (_(locale.exit_), "app.quit");

//            message (locale.locale);

            menu.append_item (item_theme);
//            menu.append_item (item_preferences);
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
        }

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

