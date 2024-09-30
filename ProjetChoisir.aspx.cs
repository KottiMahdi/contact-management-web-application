using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjetChoisir : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridDCR_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
      var refe=  cmbAffaire.Text;
        SqlDCR.SelectParameters["Reference"].DefaultValue = refe;
        GridDCR.DataBind();
    }
    protected void GridDCR_Load(object sender, EventArgs e)
    {
        var refe = cmbAffaire.Text;
        SqlDCR.SelectParameters["Reference"].DefaultValue = refe;
        GridDCR.DataBind();
    }



    protected void GridControleQualiteProj_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        var refe = cmbAffaire.Text;

        SqlControleQualiteProj.SelectParameters["Reference"].DefaultValue = refe;
        GridControleQualiteProj.DataBind();
    }

    protected void GridControleQualiteProj_Load(object sender, EventArgs e)
    {
        var refe = cmbAffaire.Text;
        SqlControleQualiteProj.SelectParameters["Reference"].DefaultValue = refe;
        GridControleQualiteProj.DataBind();
    }
    protected void GridPriority_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        SqlDataPriority.SelectParameters["Reference"].DefaultValue = cmbAffaire.Text;
        GridPrioritbyRef.DataBind();
    }

    protected void GridPriority_Load(object sender, EventArgs e)
    {
        SqlDataPriority.SelectParameters["Reference"].DefaultValue = cmbAffaire.Text;
        GridPrioritbyRef.DataBind();
    }
    protected void GridTravauxbyRef_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        SqlDataTravaux.SelectParameters["Reference"].DefaultValue = cmbAffaire.Text;
        GridTravauxbyRef.DataBind();
    }

    protected void GridTravauxbyRef_Load(object sender, EventArgs e)
    {
        SqlDataTravaux.SelectParameters["Reference"].DefaultValue = cmbAffaire.Text;
        GridTravauxbyRef.DataBind();
    }
}