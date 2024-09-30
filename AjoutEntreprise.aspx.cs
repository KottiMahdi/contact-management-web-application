using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjoutEntreprise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void callbacAjouter_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        try
        {


            callbacAjouter.JSProperties["cp_Insert"] = "";



            DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();
            var Groupe = Convert.ToInt32(cmbGroupe.Value);
            var Nom = TxtNom.Text;
            var Telephone = TxtTelephone.Text;
            var Fax = Convert.ToInt32(TxtFax.Text);
            var Adresse = TxtAdresse.Text;
            var Adresse_2 = TxtAdresse_2.Text;
            var Code_postal = Convert.ToInt32(TxtCode_postal.Text);
            var Ville = TxtVille.Text;
            var Pays = TxtPays.Text;
            var Site_internet = TxtSite_internet.Text;
            var Etat =  cmbEtat.Value.ToString();
           
            Layer.InsertEntreprise(Nom,Telephone, Fax, Adresse, Adresse_2, Code_postal, Ville, Pays, Site_internet, Groupe, Etat);

            callbacAjouter.JSProperties["cp_Insert"] = "Ajouter";
        }
        catch (Exception ex) { }
    }
}