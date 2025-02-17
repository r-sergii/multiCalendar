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

        construct{
            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
            this.theme_switcher = new MyLib.ThemeSwitcher ();
            pop.add_child (this.theme_switcher, "theme");
        }
    }
}
