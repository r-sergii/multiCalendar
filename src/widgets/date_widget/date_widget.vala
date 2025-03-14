namespace Multicalendar {

    public class DateWidget : Gtk.DrawingArea {

        private string text;
        private string date;
        private string datefull;
        private string day;
        private string week;
        private string weekday;
        private Gdk.Pixbuf pixbuf;
        private Adw.ColorScheme theme;

        public DateWidget (Multicalendar.CalendarModel model, Multicalendar.LocaleModel local)
        {
            text = model.calendar + " " + local.calendar;
            date = model.year + "/" + model.month + "/" + model.day;
            datefull = model.day + "/" + model.monthName + "/" + model.year;
            week = local.week + " : " + model.week;
            day = local.day + ": " + model.dayOfYear + " " + local.from + " " + model.daysInYear;
            weekday = local.week_day + ": " + model.dayName;
            pixbuf = new Gdk.Pixbuf.from_resource_at_scale ( model.image, 80, 80, true);

            this.set_size_request (360, 140);
            this.set_draw_func (draw_func);
        }

        private void draw_func (Gtk.DrawingArea drawing_area, Cairo.Context context, int width, int height)
        {
            var app = GLib.Application.get_default();
            var calendarService = (app as Multicalendar.Application).calendarService;
            theme = (app as Multicalendar.Application).theme;

            var x = width / 2;
            var y = height / 2;

            int size_cell_width = 340;//width / 1;
            int size_cell_height = 140;//height / 1;


            // Get necessary data:
			weak Gtk.StyleContext style_context = drawing_area.get_style_context ();
//			    int height = drawing_area.get_allocated_height ();
	//		    int width = drawing_area.get_allocated_width ();
			Gdk.RGBA color = style_context.get_color ();

            if((theme == Adw.ColorScheme.FORCE_LIGHT) || (theme == Adw.ColorScheme.PREFER_LIGHT)) {
                context.set_source_rgb (0, 0, 0);
            } else {
                context.set_source_rgb (1, 1, 1);
            }

            roundRect(context, color, //multiElement.Resourse.gNemetal,
	                x - size_cell_width / 2, y - size_cell_height / 2,
	                //width, height,
	                //size_cell_width * 0, size_cell_height * 0,
	                size_cell_width, size_cell_height,
	                50, text);

	        // show calendar icon
            Gdk.cairo_set_source_pixbuf(context, pixbuf, x - 160, y - 40);
            context.rectangle ( x - 170, y - 50,pixbuf.get_width() + 20, pixbuf.get_height() + 20);
            context.fill();
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
    	    context.set_font_size (font_size + 2);
  	        //context.move_to (x + width / 3.25 - font_size / 2, y + height / 5 + font_size / 2);
  	        context.move_to (x + width / 3.25 - font_size / 2, y + 28 + font_size / 2);
  	        //context.move_to (x, y + 12);
  	        context.show_text (datefull);

            context.set_font_size (font_size);
  	        //context.move_to (x + width / 3.25 - font_size / 2, y + height / 2.75 + font_size / 2);
  	        context.move_to (x + width / 3.25 - font_size / 2, y + 50 + font_size / 2);
  	        //context.move_to (x, y + 12);
  	        context.show_text (text);

  	        //context.move_to (x + width / 3.25 - font_size / 2, y + height / 2.1 + font_size / 2);
  	        context.move_to (x + width / 3.25 - font_size / 2, y + 66 + font_size / 2);
  	        //context.move_to (x, y + 12);
  	        context.show_text (weekday);

  	        //context.move_to (x + width / 3.25 - font_size / 2, y + height / 1.75 + font_size / 2);
  	        context.move_to (x + width / 3.25 - font_size / 2, y + 82 + font_size / 2);
  	        //context.move_to (x, y + 12);
  	        context.show_text (date);

  	        //context.move_to (x + width / 3.25 - font_size / 2, y + height / 1.5 + font_size / 2);
  	        context.move_to (x + width / 3.25 - font_size / 2, y + 98 + font_size / 2);
  	        //context.move_to (x, y + 12);
  	        context.show_text (day);

  	        //context.move_to (x + width / 3.25 - font_size / 2, y + height / 1.25 + font_size / 2);
  	        context.move_to (x + width / 3.25 - font_size / 2, y + 114 + font_size / 2);
  	        //context.move_to (x, y + 12);
  	        context.show_text (week);

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
