namespace Multicalendar {

    public class AwaitView : Gtk.DrawingArea {

        private Gdk.Pixbuf pixbuf;
        private int angle;
        private int w_pix;
        private int h_pix;

        public AwaitView ()
        {
            w_pix = 128;
            h_pix = 128;
            //string _svg = "/io/github/r_sergii/multiCalendar/image/circle_indicator128.svg";
            //string _svg = "/io/github/r_sergii/multiCalendar/image/circle_circle128.svg";
            string _svg = "/io/github/r_sergii/multiCalendar/image/petals128.svg";
            pixbuf = new Gdk.Pixbuf.from_resource ( _svg );
            angle = 0;

            //this.set_size_request (150, 150);
            this.set_size_request (w_pix + 20, h_pix + 20);
            //this.set_size_request (180, 180);
            this.set_draw_func (draw_func);

            update ();

            Timeout.add (5, update);
        }

        private void draw_func (Gtk.DrawingArea drawing_area, Cairo.Context cr, int width, int height)
        {
            var x = width / 2;
            var y = height / 2;

            cr.translate (x,y);// - (w_pix / 2 + 10), y - (h_pix / 2 + 10));
	        cr.rotate (angle * Math.PI/180);
	        cr.translate (-0.5*width, -0.5*height);
            Gdk.cairo_set_source_pixbuf(cr, pixbuf, x - w_pix / 2, y - h_pix / 2);
            cr.rectangle ( x - (w_pix / 2 + 10), y - (h_pix / 2 + 10), pixbuf.get_width() + 20, pixbuf.get_height() + 20);
            cr.fill();

        }

        private bool update () {
            angle++;
            if(angle >= 360) {
                angle = 0;
            }

            redraw_canvas ();
            return true;        // keep running this event
        }

        private void redraw_canvas () {
            queue_draw ();
        }
    }
}
