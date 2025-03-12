namespace Multicalendar {

    const string LIGHTGREY = "lightgrey";
    const string DARKGREEN = "darkgrey";

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
/*
        public RateWidget.fromModel (CurrencyModel model) {
            open = model.open;
            close = model.close;

            char[] buf = new char[double.DTOSTR_BUF_SIZE];
	        rate = close.to_str(buf);
//	        if(rate.length > 7) {
	//            rate = rate.substring(0,6);
	  //      }
	        int len = rate.length;
	        if(rate.length > 6) {
	            rate = rate.substring(0,6);

	        }
	        else {
	            rate = rate.substring(0,len);
	        }

            Gtk.Image iTrend;
	        if(close > open) {
	            trend = 1;
	            iTrend = new Gtk.Image.from_icon_name("up_green-hdpi") {
                    pixel_size = 16
                };
	        } else if (close < open) {
	            trend = -1;
	            iTrend = new Gtk.Image.from_icon_name("down_red-hdpi") {
                    pixel_size = 16
                };
	        } else {
	            trend = 0;
	            iTrend = new Gtk.Image.from_icon_name("equal_blue-hdpi") {
                    pixel_size = 16
                };
	        }

//	        Gtk.Label lRate = new Gtk.Label (rate.substring(0,6));
	        Gtk.Label lRate = new Gtk.Label (rate);
	        Gtk.Box vBox = new Gtk.Box (Gtk.Orientation.VERTICAL, 1);
            vBox.set_homogeneous (false);

	        lRate.set_markup ("<span size='12000'>" + rate + "</span>");
	        lRate.set_justify (Gtk.Justification.LEFT);

            lRate.set_use_markup(true);
            lRate.remove_css_class(LIGHTGREY);
            lRate.add_css_class(LIGHTGREY);

            vBox.append (iTrend);
            vBox.append (lRate);

            this.set_label ((string)null);
            this.set_child (vBox);

            this.remove_css_class(LIGHTGREY);
            this.add_css_class(LIGHTGREY);
        }
*/
    }
}
