namespace Multicalendar {

    class CalendarView : Gtk.DrawingArea
    {
        private Multicalendar.CalendarModel _model;
//        private Gdk.Pixbuf pixbuf;

        public CalendarView () {
//            pixbuf
  //              = new Gdk.Pixbuf.from_resource_at_scale ( "/io/github/r_sergii/multiCalendar/image/question128.svg",
    //            40, 40, true);
            set_draw_func(draw_func);
        }

        const double DSIZE = 460.0;

        const int DIVIDE1 = 50;
        const int DIVIDE2 = 250;
        const int DIVIDE3 = 100;

        private void draw_func (Gtk.DrawingArea drawing_area,
            Cairo.Context context, int width, int height)
        {
               	// Get necessary data:
			    weak Gtk.StyleContext style_context = drawing_area.get_style_context ();
//			    int height = drawing_area.get_allocated_height ();
	//		    int width = drawing_area.get_allocated_width ();
			    Gdk.RGBA color = style_context.get_color ();

                int size_cell_width = width / 8;
                int size_cell_height = height / 8;

	            roundRectDate(context, color,
	                size_cell_width * 0, size_cell_height * 0,
	                size_cell_width * 8, size_cell_height, 10);

//	            roundRectInfo(context, color,
	//                size_cell_width * 0, size_cell_height * 1,
	  //              size_cell_width, size_cell_height, 10);

//////// days week

                for(int i = 0;i<_model.shortNameDay.size;i++) {
    	            roundRectDay(context, color,
    	                size_cell_width * (i + 1), size_cell_height * 1,
    	                size_cell_width, size_cell_height, 10, _model.shortNameDay[i], _model.font);
                }
/////////// nomers weeks
                int m = int.parse(_model.firstWeekExoticMonth);
                for(int l = 1;l<=6;l++) {
    	            roundRect(context, color,
    	                size_cell_width * 0, size_cell_height * (1 + l),
    	                size_cell_width, size_cell_height, 10, m.to_string(), true);
    	            m++;
                }
//////// nomers days
                int k = 0;
                int n = 0;
                for(int i = 2;i<8;i++) {
                    for(int j = 1;j<=7;j++) {
                        k++;
                        if(k < int.parse(_model.firstDayExoticMonth)) {
            	            roundRect(context, color,
            	                size_cell_width * j, size_cell_height * i,
            	                size_cell_width, size_cell_height, 10, "");
                        }
                        else if (n < int.parse(_model.daysInMonth)){
                            n++;
                            bool higt = false;
                            if(n == int.parse(_model.day)) {
                                higt = true;
                            }
            	            roundRect(context, color,
            	                size_cell_width * j, size_cell_height * i,
            	                size_cell_width, size_cell_height, 10, n.to_string(), higt);
                        }
                        else {
                            n++;
            	            roundRect(context, color,
            	                size_cell_width * j, size_cell_height * i,
            	                size_cell_width, size_cell_height, 10, "");
                        }
                    }
	            }
        }

        private void roundRect(Cairo.Context context, Gdk.RGBA color,
            int x, int y, int width, int height, int r, string element, bool? highlighter = false)
        {
            x++;
            y++;
            width--;
            height--;
            width--;
            height--;
            message(height.to_string());
            int font_size = height / 3;// 12;
            context.move_to(x,y+height/2);
            context.set_line_width(1);
            context.arc(x+r, y+r, r, Math.PI, 3*Math.PI/2);
            context.arc(x+width-r, y+r, r, 3*Math.PI/2, 0);
            context.arc(x+width-r, y+height-r, r, 0, Math.PI/2);
            context.arc(x+r, y+height-r, r, Math.PI/2, Math.PI);
            context.close_path();

            if(highlighter) {
                context.set_source_rgb (revert(color.red), revert(color.green), revert(color.blue));
                context.fill_preserve ();
            }
//            GdkColor gColor = new MyLib.GdkColor.fromHexColor(hColor);
//	        context.set_source_rgba (gColor.getR(), gColor.getG(), gColor.getB(), gColor.getA());
	        //context.set_source_rgb (0, 0, 1);
//	        context.fill_preserve ();
	        Gdk.cairo_set_source_rgba (context, color);
	        //context.set_source_rgb(0.5, 0.5, 0.5);
            context.stroke();

//            context.select_font_face ("Adventure", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
            context.select_font_face ("MonospaceMono", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
    	    context.set_font_size (font_size);
//  	        context.move_to (x + width / 2 - font_size / 2, y + height / 2 + font_size / 2);
//  	        context.move_to (x + width / 2 - font_size, y + height / 2 + font_size / 2);
  	        context.move_to (x, y + height / 2 + font_size / 2);

//  	        context.move_to (x + width / 2 - 0 * font_size * element.length / 2 , y + height / 2 + font_size / 2);
  	        //context.move_to (x, y + 12);
  	        context.show_text (element);
  	        context.close_path();
        }


        private void roundRectDate(Cairo.Context context, Gdk.RGBA color,
            int x, int y, int width, int height, int r)
        {
            x++;
            y++;
            width--;
            height--;
            width--;
            height--;
            message(height.to_string());
            int font_size = height / 3;// 12;
            context.move_to(x,y+height/2);
            context.set_line_width(1);
            context.arc(x+r, y+r, r, Math.PI, 3*Math.PI/2);
            context.arc(x+width-r, y+r, r, 3*Math.PI/2, 0);
            context.arc(x+width-r, y+height-r, r, 0, Math.PI/2);
            context.arc(x+r, y+height-r, r, Math.PI/2, Math.PI);
            context.close_path();

//            if(highlighter) {
            context.set_source_rgb (revert(color.red), revert(color.green), revert(color.blue));
            context.fill_preserve ();
  //          }
//            GdkColor gColor = new MyLib.GdkColor.fromHexColor(hColor);
//	        context.set_source_rgba (gColor.getR(), gColor.getG(), gColor.getB(), gColor.getA());
	        //context.set_source_rgb (0, 0, 1);
//	        context.fill_preserve ();
	        Gdk.cairo_set_source_rgba (context, color);
	        //context.set_source_rgb(0.5, 0.5, 0.5);
            context.stroke();

//            context.select_font_face ("Adventure", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
//            context.select_font_face ("MonospaceMono", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
            context.select_font_face ("MonospaceMono", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
    	    context.set_font_size (font_size);
  	        context.move_to (x + DIVIDE1, y + height / 4 + font_size / 2);
  	        context.show_text (_model.day + "/ ");

            context.select_font_face (_model.font, Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
//    	    context.set_font_size (font_size);
  	        context.move_to (x + DIVIDE1 + DIVIDE1, y + height / 4 + font_size / 2);
  	        context.show_text (_model.monthName);

            context.select_font_face ("MonospaceMono", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
//    	    context.set_font_size (font_size);
  	        context.move_to (x + DIVIDE1 + DIVIDE2, y + height / 4 + font_size / 2);
  	        context.show_text (" /" + _model.year);

            var app = GLib.Application.get_default();
            var date = (app as Multicalendar.Application).dateTime;
            var months = (app as Multicalendar.Application).monthsService;
            var dateStr = date.get_day_of_month().to_string() + "/" +
                    months.listMonths[date.get_month() - 1].month;// + "/" +
                    //date.get_year().to_string();

  	        context.move_to (x + DIVIDE1, y + height / 1.5 + font_size / 2);
  	        context.show_text (dateStr);

  	        context.move_to (x + DIVIDE1 + DIVIDE2, y + height / 1.5 + font_size / 2);
  	        context.show_text ("/ " + date.get_year().to_string());

  	        context.close_path();
        }

        private void roundRectDay(Cairo.Context context, Gdk.RGBA color,
            int x, int y, int width, int height, int r, string element, string font)
        {
            x++;
            y++;
            width--;
            height--;
            width--;
            height--;
            message(height.to_string());
            int font_size = height / 3;// 12;
            context.move_to(x,y+height/2);
            context.set_line_width(1);
            context.arc(x+r, y+r, r, Math.PI, 3*Math.PI/2);
            context.arc(x+width-r, y+r, r, 3*Math.PI/2, 0);
            context.arc(x+width-r, y+height-r, r, 0, Math.PI/2);
            context.arc(x+r, y+height-r, r, Math.PI/2, Math.PI);
            context.close_path();

            context.set_source_rgb (revert(color.red), revert(color.green), revert(color.blue));
            context.fill_preserve ();

	        Gdk.cairo_set_source_rgba (context, color);
	        //context.set_source_rgb(0.5, 0.5, 0.5);
            context.stroke();

//            context.select_font_face ("Adventure", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
            context.select_font_face (font, Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
    	    context.set_font_size (font_size);
//  	        context.move_to (x + width / 2 - font_size / 2, y + height / 2 + font_size / 2);
//  	        context.move_to (x + width / 2 - font_size, y + height / 2 + font_size / 2);
  	        context.move_to (x, y + height / 2 + font_size / 2);

  	        context.show_text (element);
  	        context.close_path();
        }

        private void roundRectInfo(Cairo.Context context, Gdk.RGBA color,
            int x, int y, int width, int height, int r)
        {
            double sizePixbuf = double.min(width, height);
            x++;
            y++;
            width--;
            height--;
            width--;
            height--;
            message(height.to_string());
            int font_size = height / 3;// 12;
            context.move_to(x,y+height/2);
            context.set_line_width(1);
            context.arc(x+r, y+r, r, Math.PI, 3*Math.PI/2);
            context.arc(x+width-r, y+r, r, 3*Math.PI/2, 0);
            context.arc(x+width-r, y+height-r, r, 0, Math.PI/2);
            context.arc(x+r, y+height-r, r, Math.PI/2, Math.PI);
            context.close_path();

//            context.set_source_rgb (revert(color.red), revert(color.green), revert(color.blue));
  //          context.fill_preserve ();

	        Gdk.cairo_set_source_rgba (context, color);
	        //context.set_source_rgb(0.5, 0.5, 0.5);
            context.stroke();
  	       	context.close_path();

  	       	// show question icon

  	       	var pixbuf
                = new Gdk.Pixbuf.from_resource_at_scale ( "/io/github/r_sergii/multiCalendar/image/question128.svg",
                (int)(sizePixbuf / 2), (int)(sizePixbuf / 2), true);

            Gdk.cairo_set_source_pixbuf(context, pixbuf,
                x + width / 2 - (sizePixbuf / 2) + 20,
                y + height / 2 - (sizePixbuf / 2) + 20);
            context.rectangle (
                x + width / 2 - (sizePixbuf / 2) + 0,
                y + height / 2 - (sizePixbuf / 2) + 0,
                pixbuf.get_width() + 20, pixbuf.get_height() + 20);
            context.fill();
        }

        private double revert(double value) {
            if (value == 1) {
                return 0.35;
            }
            else if (value == 0) {
                return 0.65;
            }
            else {
                //double r = 1 - value;
                return (1 - value);
            }
        }

        public Multicalendar.CalendarModel calendarModel {
            set {
                _model = value;
                redraw_canvas ();
            }
            get {
                return _model;
            }
        }

        private void redraw_canvas () {
            queue_draw ();
        }
    }
}
