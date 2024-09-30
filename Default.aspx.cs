using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OfficeWebUI;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        var Matricule = Page.Session["matricule"];
        var User = Page.Session["UtilisateurSession"];

        if (Matricule == null)
        {
            Page.Response.Redirect("Contact.aspx");
        }
        else
        {
            lblNomSession.InnerText = User.ToString();
        }


        //DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();

        //var req = (from q in Layer.GetAdminByMatricule(Matricule.ToString()) select q).ToList();

        //var chois = req.Count();


        //if (chois == 0)
        //{

        //    MainMenuRibbon.Contexts[0].Tabs[2].Visible = false;
        //    MainMenuRibbon.Contexts[0].Tabs[3].Visible = false;

        //}
    }
}