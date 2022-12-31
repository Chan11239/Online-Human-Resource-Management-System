using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OHRMS.Helpers
{
    public partial class NotificationFunction : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OriginalTime.Text = DateTime.Now.ToLongTimeString();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            StockPrice.Text = GetStockPrice();
            TimeOfPrice.Text = DateTime.Now.ToLongTimeString();
        }

        private string GetStockPrice()
        {
            double randomStockPrice = 50 + new Random().NextDouble();
            return randomStockPrice.ToString("C");
        }
    }
}