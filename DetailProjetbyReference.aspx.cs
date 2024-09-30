using DevExpress.Web.ASPxTreeList;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DetailProjetbyReference : System.Web.UI.Page
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
            TxttypePhase.Text = req[0].Phase;
            DropDownTypeProjet.Text = req[0].Type;
            cmbClient.Text = req[0].Client;
            cmbTackForce.Text = req[0].taskforce;
            cmbClasse.Text = req[0].Classe;
            GridLookup.Text = req[0].Revision;
            txtDateDebut.Value = req[0].DD;
            TxtDateFin.Value = req[0].DF;
            MemoClient.Text = req[0].RemarqClient;
            MemoRemarqProjet.Text = req[0].RemarqProjet;
            SqlDataDiscipline.SelectParameters["Reference"].DefaultValue = reference;
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

}