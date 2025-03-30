namespace Multicalendar {
    [GtkTemplate (ui = "/io/github/r_sergii/multiCalendar/windows/browser_window/browser_window.ui")]
    public class BrowserWindow : Gtk.Window {
        [GtkChild]
        unowned Gtk.ScrolledWindow scrolled_window;

        private string wikiURL;
        private string title;

        public BrowserWindow(string url, string _title) {
            Object (//title: "Wikipedia",
			default_width: 640, default_height: 480);
//            this.add(this.create_web_window());
//            this.set_content(create_web_window(url));
//            this.destroy.connect(Gtk.main_quit);
            wikiURL = url;
            this.set_title (_title);

            var view = new WebKit.WebView();
            view.load_uri(wikiURL);//Browser.URL);
            scrolled_window.set_child(view);
        }
/*
        constructor {
        }
        private Gtk.ScrolledWindow create_web_window(string url) {
            var view = new WebKit.WebView();
            view.load_uri(url);//Browser.URL);

            var scrolled_window = new Gtk.ScrolledWindow();
            scrolled_window.set_policy(Gtk.PolicyType.AUTOMATIC, Gtk.PolicyType.AUTOMATIC);
            scrolled_window.set_child(view);

            return scrolled_window;
        }
        */
    }
}
