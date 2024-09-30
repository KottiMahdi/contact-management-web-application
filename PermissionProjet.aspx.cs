using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PermissionProjet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    

    protected void GridProjet_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
    {
        GridProjet.JSProperties["cp_add"] = "";

        var donnes = e.Parameters;

        var chois = donnes.Split('@')[0];

        if (chois == "Ajoute")
        {
            var Projet = donnes.Split('@')[2];
            var Matricules = donnes.Split('@')[1];

            DataLayerExperienceDataContext Layer = new DataLayerExperienceDataContext();

                foreach (string Proj in Projet.Split(';'))
                {
                    foreach (string Ressou in Matricules.Split(','))
                    {
                        Layer.InsertPermissionInterfaceByProj(Proj, Ressou);
                    GridProjet.JSProperties["cp_add"] = "Ajoute";
                }
                }
        }


        var Matricule = GridRessource.GetRowValues(GridRessource.FocusedRowIndex, "Matricule").ToString();
        SqlDataProjet.SelectParameters["Matricule"].DefaultValue = Matricule;
        GridProjet.DataBind();



    }

    protected void GridProjet_Load(object sender, EventArgs e)
    {
        if (IsCallback)
        {
            var Matricule = GridRessource.GetRowValues(GridRessource.FocusedRowIndex, "Matricule").ToString();
            SqlDataProjet.SelectParameters["Matricule"].DefaultValue = Matricule;
            GridProjet.DataBind();
        }
    }



    protected void GridProjet_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
    {


         

        if (e.RowType != GridViewRowType.Data)
            return;

        if (string.IsNullOrEmpty(e.GetValue("id").ToString()))

            e.Row.ForeColor = Color.FromName("#0b0600");

        else if ((!string.IsNullOrEmpty(e.GetValue("id").ToString())))
        {
            if (e.GetValue("id").ToString() == ("0"))
                e.Row.ForeColor = Color.FromName("#FF991F");
            else
            e.Row.ForeColor = Color.FromName("#0b0600");
        }
    }

    protected void GridProjet_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
    {
        if (e.VisibleIndex == -1) return;

        switch (e.ButtonType)
        {
            
            case ColumnCommandButtonType.Delete:
                e.Visible = DeleteButtonVisibleCriteria((ASPxGridView)sender, e.VisibleIndex);
                break;
        }
    }

    private bool DeleteButtonVisibleCriteria(ASPxGridView grid, int visibleIndex)
    {
        int keyValue = (int)grid.GetRowValues(visibleIndex, grid.KeyFieldName);
        return keyValue != 0;
    }
}