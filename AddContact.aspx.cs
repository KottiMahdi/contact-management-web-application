using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddContact : System.Web.UI.Page
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
        var id_civ = Convert.ToInt32(cmbCiv.Value);
        var ID_Entreprise = Convert.ToInt32(Request.QueryString["ID_Entreprise"]);
        var Nom = TxtNom.Text;
        var Pernom = TxtPrenom.Text;
        var Telephone = TxtTelephone.Text;
        var Mobile = TxtMobile.Text;
       
        var ID_Fonction = Convert.ToInt32(cmbFonction.Value);
        var Suivi_par =  Page.Session["UtilisateurSession"]; ;
        var Emailss = TxtEmails.Text;


        Layer.Insert_Contact(id_civ, Nom, Pernom, Telephone, Mobile, Emailss, ID_Fonction, ID_Entreprise, Suivi_par.ToString());

        callbacAjouter.JSProperties["cp_Insert"] = "Ajouter";
        }
        catch (Exception ex) { }


    }

    //protected void CallbackContact_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    //{
    //    AddNewContact(1, "haithem", "@test");
    //}



    //public static bool AddNewContact(int ID_Entreprise, string Nom,string E_mail)
    //{
    //    try
    //    {
    //        DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();


    //        var PR = new Nomenclature_Contact();

    //        PR.ID_Entreprise = ID_Entreprise;
    //        PR.Nom = Nom;
    //        PR.E_mail = E_mail;

    //        Layer.Nomenclature_Contacts.InsertOnSubmit(PR);

    //        return true;
    //    }
    //    catch
    //    {
    //        return false;
    //    }
    //}





}