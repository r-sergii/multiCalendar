namespace Multicalendar {

    public class ProgressWidget : Adw.Window {

        private Gtk.Box main_box;
        //private CircularProgressWidgets.CircularProgressBar pbar;
        private ProgressWidgets.ProcentProgressBar pbar;

        public ProgressWidget (Gtk.Application app) {
            Object (application: app,
            height_request: 100, width_request: 100
            //default_width: 100, default_height: 100
            );
        }

        construct{
            //get current theme
            var app = GLib.Application.get_default();
            var theme = (app as Multicalendar.Application).theme;
//            bool theme = (app as Multicalendar.Application).settingsService.theme.theme;
            var locale = (app as Multicalendar.Application).settingsService.locale;

            //var
            //pbar = new CircularProgressWidgets.CircularProgressBar ();
            pbar = new ProgressWidgets.ProcentProgressBar ();
            pbar.percentage = 0;//.44;
            pbar.line_width = 10;
            pbar.center_filled = true;
            pbar.radius_filled = true;

            if((theme == Adw.ColorScheme.FORCE_LIGHT) || (theme == Adw.ColorScheme.PREFER_LIGHT)
                || (theme == Adw.ColorScheme.DEFAULT)
//            if(theme != true
                ) {
                pbar.center_fill_color = "#FAFAFA";
            } else {
                pbar.center_fill_color = "#050505";
            }

            Gtk.Label load = new Gtk.Label(locale.loading);

            Gtk.Viewport viewport1 = new Gtk.Viewport(null, null);
            viewport1.set_size_request (72,72);
            viewport1.set_child (pbar);

            main_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 5);
            main_box.margin_top = 10;
            main_box.append (load);
            main_box.append (viewport1);

//            this.set_content(main_box);
// gtk           this.set_child(main_box);

            var centerBox = new Gtk.CenterBox ();
            centerBox.set_center_widget (main_box);
            //this.set_child (centerBox);
            this.set_content (centerBox);
            //this.append(scroll);

            isClose = false;
            Timeout.add (30, run);
        }

        private int j;

        public bool isClose { get;set; }

        private bool run()
        {
            if(j<=100) {
                j++;
                pbar.percentage = j / 100.0;
                pbar.queue_draw ();
            }
            else {
                isClose = true;
                close();
            }
            return true;
        }
    }
}

