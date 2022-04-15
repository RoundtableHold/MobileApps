using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace RoundtableHold
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            var browser = new WebView
            {
                Source = "https://roundtablehold.net"
            };
            Content = browser;
            //InitializeComponent();
        }
    }
}
