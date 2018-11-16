using System;
using Gtk;

namespace GtkApp
{
    class Program
    {
        [STAThread]
        public static void Main(string[] args)
        {
            // Quick little demo of using a function from the shared class library
            int x = ClassLibrary1.Class1.ReturnFive();
            System.Diagnostics.Debug.Assert(x == 5);

            Application.Init();

            var app = new Application("org.GtkApp.GtkApp", GLib.ApplicationFlags.None);
            app.Register(GLib.Cancellable.Current);

            var win = new MainWindow();
            app.AddWindow(win);

            win.Show();
            Application.Run();
        }
    }
}
