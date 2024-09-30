using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ModifierEntreprise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack) { 
        var ID_Entreprise = Convert.ToInt32(Request.QueryString["ID_Entreprise"]);


        DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();

        var req = (from p in Layer.GetDetailEntreprise(ID_Entreprise)
                   select p).ToList();

        TxtNom.Text = req[0].Nom;
        TxtFax.Text = req[0].Fax.ToString();
            TxtVille.Text = req[0].Ville;
            TxtCode_postal.Text = req[0].Code_postal.ToString();
        TxtTelephone.Text = req[0].Telephone.ToString();
            TxtAdresse.Text = req[0].Adresse;
            TxtSite_internet.Text = req[0].Site_internet;
            TxtPays.Text = req[0].Pays;
            TxtAdresse_2.Text = req[0].Adresse_2;

            cmbEtat.Value = req[0].ID_Etat.ToString();
            cmbEtat.DataBind();
            cmbGroupe.Value = req[0].ID_Groupe.ToString();
            cmbGroupe.DataBind();
        }


    }

    protected void callbacAjouter_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {

        callbacAjouter.JSProperties["cp_Insert"] = "";



        DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();
        var ID_Entreprise = Convert.ToInt32(Request.QueryString["ID_Entreprise"]);
        var Groupe = Convert.ToInt32(cmbGroupe.Value);
        var Nom = TxtNom.Text;
        var Telephone = Convert.ToInt32(TxtTelephone.Text);
        var Fax = Convert.ToInt32(TxtFax.Text);
        var Adresse = TxtAdresse.Text;
        var Adresse_2 = TxtAdresse_2.Text;
        var Code_postal = Convert.ToInt32(TxtCode_postal.Text);
        var Ville = TxtVille.Text;
        var Pays = TxtPays.Text;
        var Site_internet = TxtSite_internet.Text;
        var Etat = cmbEtat.Value.ToString();
        Layer.UpdateEntreprise(ID_Entreprise, Nom, Telephone, Fax, Adresse, Adresse_2, Code_postal, Ville, Pays, Site_internet, Groupe, Etat);




        callbacAjouter.JSProperties["cp_Insert"] = "Ajouter";



    }

}