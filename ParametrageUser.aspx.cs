using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ParametrageUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridRessource_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        SqlDataRessource.SelectParameters["ipAddress"].DefaultValue = GridPointeuse.GetRowValues(GridPointeuse.FocusedRowIndex, "IP").ToString(); ;
        GridRessource.DataBind();
    }
}