/* window.vala
 *
 * Copyright 2025 r-sergii
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Multicalendar {
    [GtkTemplate (ui = "/ua/inf/multiapps/multiCalendar/windows/main_window/main_window.ui")]
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
