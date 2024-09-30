
using DevExpress.Web;
using System.Web.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
 
using System.Web.UI.WebControls;

public partial class Ajouter_Evenement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void callbacAjouter_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        try
        {


            callbacAjouter.JSProperties["cp_Insert"] = "";


            var choix = e.Parameter;


            var ID_Contact = Convert.ToInt32(Request.QueryString["ID_Contact"]);

            var HD = HDebut.DateTime.TimeOfDay;
            var HF =HFin.DateTime.TimeOfDay;

            DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();
            var ID_TypeEv = Convert.ToInt32(TxtType.Value);
            var Objet = TxtObjet.Text;
            var DateDebut = DtDateDebut.Date;
            var DateFin = DtDateFin.Date;
            var DescriptionEv = TxtDescriptionEv.Text;
            var Lieu = TxtLieu.Text;



            if (choix == "Enregister")
            {

                int ID_Evenement = AddEvenement(ID_TypeEv, Objet, DateDebut, HD, DateFin, HF, Lieu, DescriptionEv, ID_Contact, 1);


                var ListActionSupervisor = GrdValidateur.GridView.GetSelectedFieldValues("Matricule");
                AddGestionAcces(ID_Evenement, ListActionSupervisor);
            }

            else if (choix == "Envoyer")
            {
                int ID_Evenement = AddEvenement(ID_TypeEv, Objet, DateDebut, HD, DateFin, HF, Lieu, DescriptionEv, ID_Contact, 2);
                var ListActionSupervisor = GrdValidateur.GridView.GetSelectedFieldValues("Matricule");
                AddGestionAcces(ID_Evenement, ListActionSupervisor);



            }







            callbacAjouter.JSProperties["cp_Insert"] = "Ajouter";






        }
        catch (Exception ex) { }
    }

    public static int AddEvenement(int ID_TypeEv, string Objet,   DateTime? DateDebut, TimeSpan HD, DateTime? DateFin, TimeSpan HF, string Lieu, string DescriptionEv,int ID_Contact, int Status)
    {
        try
        {
            DataLayerExperienceDataContext layer = new DataLayerExperienceDataContext();

            Nomenclature_Evenement ac = new Nomenclature_Evenement();

            ac.ID_TypeEv = ID_TypeEv;
            ac.Objet = Objet;
            
            ac.DateDebut = DateDebut;
            ac.Heure = HD;
            ac.DateFin = DateFin;
            ac.HeureFin = HF;

            ac.Lieu = Lieu;
            ac.DescriptionEv = DescriptionEv;
            ac.ID_Contact = ID_Contact;
            ac.ID_Status = Status;
            layer.Nomenclature_Evenement.InsertOnSubmit(ac);
            layer.SubmitChanges();




            
            return ac.ID_Evenement;
        }
        catch (Exception ex)
        {
            return -1;
            throw ex;

        }
    }


  
    public static int AddGestionAcces(int ID_FicheIntervention,  List<object> Supervisor)
    {

        try
        {

            DeleteSupervisor(ID_FicheIntervention);
            foreach (int item in Supervisor)
            {
                AddSupervisor(ID_FicheIntervention, item);
                SendEmail(item);

            }

            return ID_FicheIntervention;
        }
        catch (Exception ex)
        {
            return -1;
            throw ex;

        }
    }
    public static void DeleteSupervisor(int ID_Evenement)
    {
        try
        {
            DataLayerExperienceDataContext layer = new DataLayerExperienceDataContext();
            List<Attribut_Evenement> aoList = (from p in layer.Attribut_Evenement where p.ID_Evenement == ID_Evenement select p).ToList();
            if (aoList.Count > 0)
            {
                foreach (Attribut_Evenement item in aoList)
                {
                    layer.Attribut_Evenement.DeleteOnSubmit(item);
                    layer.SubmitChanges();
                }
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    public static void AddSupervisor(int ID_Evenement, int Matricule)
    {
        try
        {
            DataLayerExperienceDataContext layer = new DataLayerExperienceDataContext();
            Attribut_Evenement ass = new Attribut_Evenement();
            ass.Matricule = Matricule;
            ass.ID_Evenement = ID_Evenement;
            layer.Attribut_Evenement.InsertOnSubmit(ass);
            layer.SubmitChanges();

        }
        catch (Exception)
        {
            throw;
        }

    }



    public static void SendEmail(int Matricule)
    {
        try
        {


            var fromAddress = new System.Net.Mail.MailAddress("stagecontacte@gmail.com");
            var fromPassword = "Eppm123*@#";




            DataLayerExperienceDataContext layer = new DataLayerExperienceDataContext();
            Utilisateur PD = (from x in layer.Utilisateur
                              where x.id == Matricule
                              select x).SingleOrDefault();




            var toAddress = new System.Net.Mail.MailAddress(PD.Email);

            string subject = "Rappel";
            String Nom = PD.users;


            var body = new HtmlString(string.Format("<table style='font-family:Tahoma;width: 100%;'><tbody><tr><td style='background-color:#990000; color: #FFFFFF; text-decoration: blink; font-size: large; font-family: Arial; text-align: center; font-weight: bold;'>EPPM</td><td style='background-color:#006699; color: #FFFFFF; font-weight: normal; font-size: large; font-family: Arial'>&nbsp;Gestion Contact</td></tr><tr><td></td><td style='font-size: 12px; color: #000000;'>&nbsp;<br />Bonjour<strong style='font-family: Tahoma;'> {0},</strong><br />&nbsp;<br />    Vous avez Rappel&nbsp;<br />Contact&nbsp; &nbsp; &nbsp; &nbsp; : <strong style='font-family: Tahoma;'>{1}</strong><br />    Bénéficiaire&nbsp; :&nbsp;<strong style='font-family: Tahoma;'>{2}</strong><br /><span style='font-family: Tahoma, Geneva, sans-serif;'><span style='white-space: nowrap;'>contact&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></span><span style='font-family: Tahoma;'>: <strong>{3}</strong><br /><br />   Pour accéder à la demande, veuillez cliquer sur le lien suivant : <a href='{4}' target='_blank'>{1}</a>    <br />Merci<br />    <br />    </span><div style='font-size:11px;font-weight:bold;'>Gestion&nbsp; de contact,<br />    <a href='http://www.eppm.com.tn'>EPPM</a></div><br /><br /><br /></td></tr><tr><td>&nbsp;</td><td style='color: #000000; font-weight: bold;'>&nbsp;</td></tr></tbody></table>&nbsp;", Nom, "user 2", " user 3", "user 4", "user 5"));


            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,

                DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new System.Net.NetworkCredential(fromAddress.Address, fromPassword)
            };

            using (var message = new System.Net.Mail.MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body.ToString(),
                IsBodyHtml = true

            })

                smtp.Send(message);
        }
        catch (Exception ex)
        {


        }

    }


}