using DevExpress.Web.ASPxTreeList;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Transfaire : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

         SqlDCR.SelectParameters["Reference"].DefaultValue = "-1";

        SqlDataProjet.SelectParameters["idclient"].DefaultValue = "-1";
        SqlDataProjet.SelectParameters["idphace"].DefaultValue = "-1";
        SqlDataProjet.SelectParameters["idTypeProjet"].DefaultValue = "-1";
        SqlDataProjet.SelectParameters["taskforce"].DefaultValue = "Tous";
        SqlDataProjet.SelectParameters["idclasseProjet"].DefaultValue = "-1";
        SqlDataProjet.SelectParameters["Revision"].DefaultValue = "Tous";
            selList.Text="";
        }
    }
    protected void DropDownTypeProjet_CustomJSProperties(object sender, DevExpress.Web.CustomJSPropertiesEventArgs e)
    {
        ASPxTreeList tree = DropDownTypeProjet.FindControl("treeListType") as ASPxTreeList;

        Hashtable depNames = new Hashtable();
        foreach (TreeListNode node in tree.GetVisibleNodes())
            depNames.Add(node.Key, node["Type"]);
        e.Properties["cpDepName"] = depNames;
    }
    protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {
        ASPxCallbackPanel1.JSProperties["cp_Insert"] = "";
        DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();

        var chois = txtcodeDoc.Text.Split(',');
        var newRef = TxtNewRef.Text;
        var Marticule = "";
        try
        {
            Marticule = Page.Session["matricule"].ToString();

        }
        catch (Exception ex)
        {
            ASPxCallbackPanel1.JSProperties["cp_Insert"] = "Session";

        }
        

        var PereCode = TxtPrimerecode.Text;
        var DeuxCode = TxtDeuxCode.Text;

        var newCodeDocument = "";
        var oldCodeDocument = "";

        var count = chois.Count();


        for (int i=0; i<= (count -1); i++)
        {
            oldCodeDocument = chois[i].ToString();

            var codePr = oldCodeDocument.Substring(5, 8);
            var codeDS = oldCodeDocument.Substring(15, 4);

            newCodeDocument = PereCode + codePr + DeuxCode + codeDS ;
            Layer.InsertDocEtudeETQualiteProjet(Marticule, newCodeDocument, oldCodeDocument, newRef);
            ASPxCallbackPanel1.JSProperties["cp_Insert"] = "ajouter";
        }
 
        

    }

    protected void GridDCRUser_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        var newRef = TxtNewRef.Text;
        SqlDataDCRUser.SelectParameters["Reference"].DefaultValue = newRef;
        GridDCRUser.DataBind();

    }

    protected void GridDCRUser_Load(object sender, EventArgs e)
    {
        var newRef = TxtNewRef.Text;
        SqlDataDCRUser.SelectParameters["Reference"].DefaultValue = newRef;
        GridDCRUser.DataBind();
    }

    protected void GridControleQualiteProj_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        var refe = TxtNewRef.Text;

        SqlControleQualiteProj.SelectParameters["Reference"].DefaultValue = refe;
        GridControleQualiteProj.DataBind();
    }

    protected void GridControleQualiteProj_Load(object sender, EventArgs e)
    {
        var refe = TxtNewRef.Text;
        SqlControleQualiteProj.SelectParameters["Reference"].DefaultValue = refe;
        GridControleQualiteProj.DataBind();
    }


    protected void documentViewer_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
        //    var Affaire = TxtNewRef.Text;


        //    XtraReportDocumenEtude Report = new XtraReportDocumenEtude();
        ////    Report.Parameters[0].Value = Affaire.ToString();
        ////    Report.Parameters[0].Visible = false;
        //    documentViewer.Report = Report;

        }
    }

    protected void CallbackdocumentViewer_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
    {

    }

    protected void TxttypePhase_DataBound(object sender, EventArgs e)
    {
        TxttypePhase.Items.Add("Tous", -1).Index=0;
        TxttypePhase.SelectedIndex = 0;
    }

    protected void treeListType_DataBound(object sender, EventArgs e)
    {
        DropDownTypeProjet.Text = "Tous";
    }

    protected void cmbClient_DataBound(object sender, EventArgs e)
    {
        cmbClient.Items.Add("Tous", -1).Index = 0;
        cmbClient.SelectedIndex = 0;
    }

    protected void cmbClasse_DataBound(object sender, EventArgs e)
    {
        cmbClasse.Items.Add("Tous", -1).Index = 0;
        cmbClasse.SelectedIndex = 0;
    }

    //protected void GridLookup_DataBound(object sender, EventArgs e)
    //{
    //    // GridLookup.Columns.Add("Tous").Index = 0;
    //    // GridLookup.SelectedIndex = 0;
    //    GridLookup.Columns.Add("TagName");
    //}

    protected void GridLookup_DataBound(object sender, EventArgs e)
    {
        GridLookup.SelectedIndex = 0;
    }

    protected void GridProjet_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        ASPxTreeList tree = DropDownTypeProjet.FindControl("treeListType") as ASPxTreeList;

        

        SqlDataProjet.SelectParameters["idclient"].DefaultValue = cmbClient.Value.ToString(); 
        SqlDataProjet.SelectParameters["idphace"].DefaultValue = TxttypePhase.Value.ToString();
        SqlDataProjet.SelectParameters["idTypeProjet"].DefaultValue = tree.FocusedNode.Key;
        SqlDataProjet.SelectParameters["taskforce"].DefaultValue = cmbTackForce.Text;
        SqlDataProjet.SelectParameters["idclasseProjet"].DefaultValue = cmbClasse.Value.ToString();
        SqlDataProjet.SelectParameters["Revision"].DefaultValue = GridLookup.Text;

        GridProjet.DataBind();
    }

    protected void GridDCR_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {

        var chois = e.Parameters;
        SqlDCR.SelectParameters["Reference"].DefaultValue = chois;
        GridDCR.DataBind();
    }

    protected void GridProjet_Load(object sender, EventArgs e)
    {
        var chois = selList.Text;

        if (chois != "")
        {
            SqlDCR.SelectParameters["Reference"].DefaultValue = chois;
            GridDCR.DataBind();
        }

    }
}