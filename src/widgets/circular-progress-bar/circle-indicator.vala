namespace ProgressWidgets {

    public class CircleIndicator : Gtk.DrawingArea {

        private Gdk.Pixbuf pixbuf;
        private int angle;
        private int w_pix;
        private int h_pix;

        public CircleIndicator (int w, int h)
        {
            w_pix = w;
            h_pix = h;
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

            Timeout.add (10, update);
        }

        private void draw_func (Gtk.DrawingArea drawing_area, Cairo.Context cr, int width, int height)
        {
            var x = width / 2;
            var y = height / 2;

            //cr.translate (65.0, 65.0);
            cr.translate (w_pix / 2, h_pix / 2);
	        cr.rotate (angle * Math.PI/180);
//	        cr.scale  (129.0/width, 129.0/height);
	        cr.translate (-0.5*width, -0.5*height);
            //Gdk.cairo_set_source_pixbuf(cr, pixbuf, x - 65, y - 65);
            Gdk.cairo_set_source_pixbuf(cr, pixbuf, x - w_pix / 2, y - h_pix / 2);
            //cr.rectangle ( x - 65, y - 65, pixbuf.get_width(), pixbuf.get_height());
            //cr.rectangle ( x - 75, y - 75, pixbuf.get_width() + 20, pixbuf.get_height() + 20);
            cr.rectangle ( x - (w_pix / 2 + 10), y - (h_pix / 2 + 10), pixbuf.get_width() + 20, pixbuf.get_height() + 20);
            cr.fill();

            // show svg
//            Gdk.cairo_set_source_pixbuf(cr, pixbuf, x - 65, y - 65);
  //          cr.rectangle ( x - 75, y - 75, pixbuf.get_width() + 20, pixbuf.get_height() + 20);
    //        cr.fill();

//            cr.translate (128.0, 128.0);
	//        cr.rotate (45*Math.PI/180);
	  //      cr.scale  (256.0/w, 256.0/h);
//	        cr.translate (-0.5*w, -0.5*h);
	//        cr.set_source_surface (image, 0, 0);
	  //      cr.paint ();
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
