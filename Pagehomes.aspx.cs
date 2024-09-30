using DevExpress.DashboardWeb;
using DevExpress.DataAccess.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pagehomes : System.Web.UI.Page
{
    string dashboardsPath = @"C:/Experience/DashboardXml/";
    protected void Page_Load(object sender, EventArgs e)
    {
        DashboardFileStorage storage = new DashboardFileStorage(dashboardsPath);
        Dashboard.SetDashboardStorage(storage);

        Dashboard.SetDashboardStorage(storage);
        Dashboard.SetConnectionStringsProvider(new ConfigFileConnectionStringsProvider());
        Dashboard.AllowInspectAggregatedData = true;
        Dashboard.AllowInspectRawData = true;
    }
}