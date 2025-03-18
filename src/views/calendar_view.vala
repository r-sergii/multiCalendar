namespace Multicalendar {

    class CalendarView : Gtk.DrawingArea
    {
        private Multicalendar.CalendarModel _model;

        public CalendarView () {
            set_draw_func(draw_func);
        }

        const double DSIZE = 460.0;

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

	            roundRect(context, color,
	                size_cell_width * 0, size_cell_height * 0,
	                size_cell_width * 8, size_cell_height, 10, "Date");
////////
	            roundRect(context, color,
	                size_cell_width * 1, size_cell_height * 1,
	                size_cell_width, size_cell_height, 10, "Mon");

	            roundRect(context, color,
	                size_cell_width * 2, size_cell_height * 1,
	                size_cell_width, size_cell_height, 10, "Tue");

	            roundRect(context, color,
	                size_cell_width * 3, size_cell_height * 1,
	                size_cell_width, size_cell_height, 10, "Wed");

	            roundRect(context, color,
	                size_cell_width * 4, size_cell_height * 1,
	                size_cell_width, size_cell_height, 10, "Thu");

	            roundRect(context, color,
	                size_cell_width * 5, size_cell_height * 1,
	                size_cell_width, size_cell_height, 10, "Fri");

	            roundRect(context, color,
	                size_cell_width * 6, size_cell_height * 1,
	                size_cell_width, size_cell_height, 10, "Sat");

	            roundRect(context, color,
	                size_cell_width * 7, size_cell_height * 1,
	                size_cell_width, size_cell_height, 10, "Sun");
///////////
	            roundRect(context, color,
	                size_cell_width * 0, size_cell_height * 2,
	                size_cell_width, size_cell_height, 10, "12");

	            roundRect(context, color,
	                size_cell_width * 0, size_cell_height * 3,
	                size_cell_width, size_cell_height, 10, "13");

	            roundRect(context, color,
	                size_cell_width * 0, size_cell_height * 4,
	                size_cell_width, size_cell_height, 10, "14");

	            roundRect(context, color,
	                size_cell_width * 0, size_cell_height * 5,
	                size_cell_width, size_cell_height, 10, "15");

	            roundRect(context, color,
	                size_cell_width * 0, size_cell_height * 6,
	                size_cell_width, size_cell_height, 10, "16");

	            roundRect(context, color,
	                size_cell_width * 0, size_cell_height * 7,
	                size_cell_width, size_cell_height, 10, "17");

////////
                int k = 0;
                int n = 0;
                for(int i = 2;i<8;i++) {
                    for(int j = 1;j<=7;j++) {
                        k++;
                        if(k < int.parse(_model.dayExoticMonth)) {
            	            roundRect(context, color,
            	                size_cell_width * j, size_cell_height * i,
            	                size_cell_width, size_cell_height, 10, "");
                        }
                        else if (n < int.parse(_model.daysInMonth)){
                            n++;
            	            roundRect(context, color,
            	                size_cell_width * j, size_cell_height * i,
            	                size_cell_width, size_cell_height, 10, n.to_string());
                        }
                        else {
                            n++;
            	            roundRect(context, color,
            	                size_cell_width * j, size_cell_height * i,
            	                size_cell_width, size_cell_height, 10, "");
                        }
                    }
/*	            roundRect(context, color,
	                size_cell_width * 1, size_cell_height * i,
	                size_cell_width, size_cell_height, 10, "");

	            roundRect(context, color,
	                size_cell_width * 2, size_cell_height * i,
	                size_cell_width, size_cell_height, 10, "");

	            roundRect(context, color,
	                size_cell_width * 3, size_cell_height * i,
	                size_cell_width, size_cell_height, 10, "");

	            roundRect(context, color,
	                size_cell_width * 4, size_cell_height * i,
	                size_cell_width, size_cell_height, 10, "");

	            roundRect(context, color,
	                size_cell_width * 5, size_cell_height * i,
	                size_cell_width, size_cell_height, 10, "");

	            roundRect(context, color,
	                size_cell_width * 6, size_cell_height * i,
	                size_cell_width, size_cell_height, 10, "");

	            roundRect(context, color,
	                size_cell_width * 7, size_cell_height * i,
	                size_cell_width, size_cell_height, 10, "");
	                */
	            }
        }

        private void roundRect(Cairo.Context context, Gdk.RGBA color, int x, int y, int width, int height, int r, string element)
        {
            x++;
            y++;
            width--;
            height--;
            width--;
            height--;
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
	        Gdk.cairo_set_source_rgba (context, color);
	        //context.set_source_rgb(0.5, 0.5, 0.5);
            context.stroke();

            context.select_font_face ("Adventure", Cairo.FontSlant.NORMAL, Cairo.FontWeight.BOLD);
    	    context.set_font_size (font_size);
  	        context.move_to (x + width / 2 - font_size / 2, y + height / 2 + font_size / 2);
  	        //context.move_to (x, y + 12);
  	        context.show_text (element);
  	        context.close_path();
        }

        public Multicalendar.CalendarModel calendarModel {
            set {
                _model = value;
                redraw_canvas ();
            }
        }

        private void redraw_canvas () {
            queue_draw ();
        }
    }
}
