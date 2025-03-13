namespace Multicalendar {

    public class DateWidget : Gtk.DrawingArea {

        private string text;

        public DateWidget (string _text)//Multiclock.ClockModel model, string __svg)
        {
            text = _text;

            this.set_size_request (300, 300);
            this.set_draw_func (draw_func);
        }

        private void draw_func (Gtk.DrawingArea drawing_area, Cairo.Context context, int width, int height)
        {
            var x = width / 2;
            var y = height / 2;

            int size_cell_width = 300;//width / 1;
            int size_cell_height = 300;//height / 1;


            // Get necessary data:
			weak Gtk.StyleContext style_context = drawing_area.get_style_context ();
//			    int height = drawing_area.get_allocated_height ();
	//		    int width = drawing_area.get_allocated_width ();
			Gdk.RGBA color = style_context.get_color ();

            roundRect(context, color, //multiElement.Resourse.gNemetal,
	                x - size_cell_width / 2, y - size_cell_height / 2,
	                //width, height,
	                //size_cell_width * 0, size_cell_height * 0,
	                size_cell_width, size_cell_height,
	                100, text);
        }

        private void roundRect(Cairo.Context context, Gdk.RGBA color, //MyLib.HexColor hColor,
            int x, int y, int width, int height, int r, string text)
        {
            int font_size = 12;
            context.move_to(x,y+height/2);
            context.set_line_width(1);
            context.arc(x+r, y+r, r, Math.PI, 3*Math.PI/2);
            context.arc(x+width-r, y+r, r, 3*Math.PI/2, 0);
            context.arc(x+width-r, y+height-r, r, 0, Math.PI/2);
            context.arc(x+r, y+height-r, r, Math.PI/2, Math.PI);
            context.close_path();
//            GdkColor gColor = new MyLib.GdkColor.fromHexColor(hColor);
//	        context.set_source_rgba (gColor.getR(), gColor.getG(), gColor.getB(), gColor.getA());
	        //context.set_source_rgb (0, 0, 1);
//	        context.fill_preserve ();
////////	        Gdk.cairo_set_source_rgba (context, color);
	        context.set_source_rgb(0.5, 0.5, 0.5);
            context.stroke();

            context.select_font_face ("Adventure", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
    	    context.set_font_size (font_size);
  	        context.move_to (x + width / 2 - font_size / 2, y + height / 2 + font_size / 2);
  	        //context.move_to (x, y + 12);
  	        context.show_text (text);
  	        context.close_path();
        }
    }

//    const string LIGHTGREY = "lightgrey";
//    const string DARKGREEN = "darkgrey";
/*
    public class DateWidget : Gtk.Button //
    {
        string name;

        public DateWidget (string _name) {
            name = _name;

            this.set_can_shrink (true);
            this.set_halign(Gtk.Align.CENTER);
//            this.set_size_request (100, 100);

//	        Gtk.Label lRate = new Gtk.Label (rate.substring(0,6));
	        Gtk.Label lRate = new Gtk.Label (name);
	        //Gtk.Box vBox = new Gtk.Box (Gtk.Orientation.VERTICAL, 1);
	        Gtk.Box vBox = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 1);
            vBox.set_homogeneous (false);
            vBox.margin_top = 10;
            vBox.margin_bottom = 10;

            //var centerBox = new Gtk.CenterBox ();
            //centerBox.set_center_widget (lRate);

	        lRate.set_markup ("<span size='12000'>" + name + "</span>");
	        lRate.set_justify (Gtk.Justification.LEFT);

            lRate.set_use_markup(true);
            lRate.remove_css_class(LIGHTGREY);
            lRate.add_css_class("windowcontrols");

//            vBox.append (iTrend);
            vBox.append (lRate);

            this.set_label ((string)null);
            this.set_child (vBox);
            //this.set_child (centerBox);

            this.remove_css_class(LIGHTGREY);
            this.add_css_class("windowcontrols");
        }
    }
    */
}
