using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RemarqClient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();


        var reference = Request.QueryString["References"].ToString();
        var req = (from q in Layer.GetDetailProjet(reference) select q).ToList();


        if (req.Count() != 0)
        {
            TxtRef.Text = req[0].reference;
            TxtDescription.Text = req[0].Description; 
            MemoClient.Text = req[0].RemarqClient;
        }
    }
}