namespace Multicalendar {

    public class WaitView : Gtk.Box {

        public WaitView () {
            Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
        }

        construct{
            var pbar = new ProgressWidgets.ProcentProgressBar ();
            pbar.percentage = 0.44;
            pbar.line_width = 10;
            pbar.line_cap = 20;
//            pbar.center_filled = true;
            pbar.radius_filled = true;

//            pbar.center_fill_color = "#FAFAFA";
            pbar.radius_fill_color = "#009988";
            pbar.progress_fill_color = "#dddaad";

            Gtk.Viewport viewport1 = new Gtk.Viewport(null, null);
            viewport1.set_size_request (72,72);
            viewport1.set_child (pbar);

            this.append (viewport1);
        }
    }
}
