namespace Multicalendar {

    public class WaitView : Gtk.Box {

        public WaitView () {
            Object (orientation: Gtk.Orientation.VERTICAL, spacing: 10);
        }

        construct{
            var pbar = new ProgressWidgets.CircularProgressBar ();
            pbar.percentage = 0.44;
            pbar.line_width = 3;
            pbar.line_cap =  Cairo.LineCap.BUTT;
 //           pbar.center_filled = true;
            pbar.radius_filled = true;

            pbar.center_fill_color = "#0A0A0A";
            pbar.radius_fill_color = "#009988";
            pbar.progress_fill_color = "#AAAAAA";

            var circle = new ProgressWidgets.CircleIndicator (128,128);

            Gtk.Viewport viewport1 = new Gtk.Viewport(null, null);
//            viewport1.set_size_request (172,172);
//            viewport1.set_child (pbar);
            viewport1.set_size_request (150,150);
            viewport1.set_child (circle);

            var centerBox = new Gtk.CenterBox ();
            centerBox.set_center_widget (viewport1);
            //this.set_child (centerBox);
            this.append (centerBox);

//            this.append (viewport1);
//            this.append (circle);

//            var circle = new ProgressWidgets.CircleIndicator ();
        }
    }
}
