using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DetailEntreprise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var ID_Entreprise = Convert.ToInt32(Request.QueryString["ID_Entreprise"]);


        DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();

        var req = (from p in Layer.GetDetailEntreprise(ID_Entreprise)
                   select p).ToList();

        TxtEntreprise.Text = req[0].Nom.ToString();
        TxtFax.Text = req[0].Fax.ToString();
        tbCountry.Text = req[0].Ville.ToString();
        tbLastName.Text = req[0].Code_postal.ToString();
        TxtTel.Text = req[0].Telephone.ToString();
        TxtAdresse.Text = req[0].Adresse.ToString();
        TxtSite_internet.Text = req[0].Site_internet.ToString();
        TxtPays.Text = req[0].Pays.ToString();
        TxtAdresse2.Text = req[0].Adresse_2.ToString();

        TxtEtat.Text = req[0].Etat.ToString();
        TxtGroupe.Text = req[0].Groupe.ToString();


    }
}